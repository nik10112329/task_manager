import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/clients/google_client/firebase_client.dart';
import 'package:uuid/v4.dart';

class UserSyncService {
  UserSyncService._();

  static final UserSyncService instance = UserSyncService._();

  CollectionReference<Map<String, dynamic>> get _users =>
      FirebaseClient.firestore.collection('users');

  Future<TMUser> syncUser({
    required String id,
    required SignInMethod provider,
    String? displayName,
    String? email,
    String? photoUrl,
    List<String>? deviceIds,
  }) async {
    final now = DateTime.now();

    final byEmail = await _users
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (byEmail.docs.isEmpty) {
      return _createUser(
        id: id,
        email: email ?? '',
        provider: provider,
        displayName: displayName,
        photoUrl: photoUrl,
        deviceIds: deviceIds,
        createDate: now,
      );
    }

    return _updateUser(
      doc: byEmail.docs.first,
      provider: provider,
      displayName: displayName,
      photoUrl: photoUrl,
      now: now,
    );
  }

  Future<TMUser> syncVkUser({
    required String vkId,
    required String firstName,
    required String lastName,
    String? photoUrl,
  }) async {
    final existing = await findUserByVkId(vkId);

    if (existing != null) {
      return existing;
    }

    final user = TMUser.fromVkSignIn(
      id: const UuidV4().generate(),
      vkId: vkId,
      email: '',
      firstName: firstName,
      lastName: lastName,
      photoUrl: photoUrl,
    );

    await _users.doc(user.id).set(user.toJson());

    return user;
  }

  Future<TMUser?> findUserByVkId(String vkId) async {
    final snapshot = await _users
        .where('idLinkedProvider', isEqualTo: vkId)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) {
      return null;
    }

    return TMUser.fromJson(snapshot.docs.first.data());
  }

  Future<TMUser> _createUser({
    required String id,
    required String email,
    required SignInMethod provider,
    required DateTime createDate,
    String? displayName,
    String? photoUrl,
    List<String>? deviceIds,
  }) async {
    final user = TMUser(
      id: id,
      email: email,
      signInMethod: provider,
      linkedProviders: [provider],
      displayName: displayName,
      photoUrl: photoUrl,
      emailVerified: true,
      createdAt: createDate,
      lastLoginAt: createDate,
      rustoreTokens: deviceIds,
    );

    await _users.doc(id).set(user.toJson());

    return user;
  }

  Future<TMUser> _updateUser({
    required QueryDocumentSnapshot<Map<String, dynamic>> doc,
    required SignInMethod provider,
    required DateTime now,
    String? displayName,
    String? photoUrl,
  }) async {
    final existing = doc.data();

    final updates = <String, dynamic>{
      'lastLoginAt': now.toIso8601String(),
    };

    if (displayName != null) {
      updates['displayName'] = displayName;
    }

    if (photoUrl != null) {
      updates['photoUrl'] = photoUrl;
    }

    await _users.doc(doc.id).update(updates);

    return TMUser.fromJson({
      ...existing,
      ...updates,
    });
  }
}

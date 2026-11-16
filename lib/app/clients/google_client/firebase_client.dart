import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/project/models/project/project.dart';
import 'package:task_manager/features/tags/models/tag/tag.dart';
import 'package:uuid/uuid.dart';

class FirebaseClient {
  static late final FirebaseFirestore firestore;
  final _uuid = const Uuid();

  Future<void> initial() async {
    await Firebase.initializeApp();
    firestore = FirebaseFirestore.instance;
  }

  Future<List<TMProject>> fetchAllProjects() async {
    final projectDocs = await firestore
        .collection('projects')
        .orderBy('start_date')
        .get();

    final List<TMProject> projects = [];
    for (final doc in projectDocs.docs) {
      final TMProject project = TMProjectFirestore.fromFirestore(doc);
      projects.add(project);
    }
    return projects;
  }

  Future<List<TMProject>> fetchUserProjects(String userId) async {
    final ownerSnapshot = await firestore
        .collection('projects')
        .where('owner_id', isEqualTo: userId)
        .get();

    final participantSnapshot = await firestore
        .collection('projects')
        .where('participants_ids', arrayContains: userId)
        .get();
    debugPrint('PART SNAPSHOT $participantSnapshot');
    final Map<String, TMProject> projectsMap = {};

    for (final doc in ownerSnapshot.docs) {
      final project = TMProjectFirestore.fromFirestore(doc);
      projectsMap[project.id] = project;
    }

    for (final doc in participantSnapshot.docs) {
      final project = TMProjectFirestore.fromFirestore(doc);
      projectsMap[project.id] = project;
    }
    debugPrint('$projectsMap');
    final projects = projectsMap.values.toList()
      ..sort((a, b) {
        final dateA = a.startDate ?? DateTime(0);
        final dateB = b.startDate ?? DateTime(0);
        return dateA.compareTo(dateB);
      });
    debugPrint('$projects');
    return projects;
  }

  Future<TMProject> addProject({required TMProject project}) async {
    final projectId = _uuid.v4();
    final projectWthId = project.copyWith(id: projectId);
    await firestore
        .collection('projects')
        .doc(projectId)
        .set(projectWthId.toJson());
    return projectWthId;
  }

  Future<void> updateProject(TMProject project) async {
    await firestore
        .collection('projects')
        .doc(project.id)
        .update(project.copyWith(updatedAt: DateTime.now()).toJson());
  }

  Future<String?> addTask({required TMTask task}) async {
    try {
      final taskId = task.id.isEmpty ? _uuid.v4() : task.id;
      final batch = firestore.batch();

      final projectTaskRef = firestore
          .collection('projects/${task.projectId}/tasks')
          .doc(taskId);

      final flatTaskRef = firestore.collection('tasks').doc(taskId);

      batch
        ..set(projectTaskRef, task.copyWith(id: taskId).toJson())
        ..set(flatTaskRef, task.copyWith(id: taskId).toJson());

      await batch.commit();
      return taskId;
    } catch (e) {
      debugPrint('Task Add Error: $e');
      return null;
    }
  }

  Future<List<TMTask>> fetchTasks({required List<String> projectIds}) async {
    if (projectIds.isEmpty) return [];

    try {
      final snapshot = await firestore
          .collection('tasks')
          .where('projectId', whereIn: projectIds)
          .orderBy('created_at', descending: true)
          .get();

      return snapshot.docs.map(TMTaskFirestore.fromFirestore).toList();
    } catch (e) {
      debugPrint('Error fetching tasks: $e');
      return [];
    }
  }

  Future<List<TMTask>> fetchUserTasks(String userId) async {
    final snapshot = await firestore
        .collection('tasks')
        .where('ownerId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => TMTask.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  Future<void> updateTask({required TMTask task}) async {
    final updatedTask = task.copyWith(updatedAt: DateTime.now());

    final batch = firestore.batch();

    final projectTaskRef = firestore
        .collection('projects/${task.projectId}/tasks')
        .doc(task.id);

    final flatTaskRef = firestore.collection('tasks').doc(task.id);

    batch
      ..update(projectTaskRef, updatedTask.toJson())
      ..update(flatTaskRef, updatedTask.toJson());

    await batch.commit();
  }

  Future<void> deleteTask({
    required String projectId,
    required String taskId,
  }) async {
    final batch = firestore.batch();

    final projectTaskRef = firestore
        .collection('projects/$projectId/tasks')
        .doc(taskId);

    final flatTaskRef = firestore.collection('tasks').doc(taskId);

    batch
      ..delete(projectTaskRef)
      ..delete(flatTaskRef);

    await batch.commit();
  }

  Future<List<TMUser>> fetchUsers({String? searchQuery, int limit = 50}) async {
    try {
      if (searchQuery == null || searchQuery.trim().isEmpty) {
        final snapshot = await firestore
            .collection('users')
            .orderBy('displayName')
            .limit(limit)
            .get();

        return snapshot.docs
            .map((doc) => TMUser.fromJson({...doc.data(), 'id': doc.id}))
            .toList();
      }

      final search = searchQuery.trim();
      final nameSnapshot = await firestore
          .collection('users')
          .where('displayName', isGreaterThanOrEqualTo: search)
          .where('displayName', isLessThanOrEqualTo: '$search\uf8ff')
          .limit(limit)
          .get();

      final emailSnapshot = await firestore
          .collection('users')
          .where('email', isGreaterThanOrEqualTo: search)
          .where('email', isLessThanOrEqualTo: '$search\uf8ff')
          .limit(limit)
          .get();

      final allUsers = {...nameSnapshot.docs, ...emailSnapshot.docs}
          .map((doc) => TMUser.fromJson({...doc.data(), 'id': doc.id}))
          .toSet()
          .toList();

      return allUsers;
    } catch (e) {
      debugPrint('Error fetching users: $e');
      return [];
    }
  }

  Future<List<TMUser>> fetchAllUsers() async {
    try {
      final snapshot = await firestore.collection('users').get();
      return snapshot.docs
          .map((doc) => TMUser.fromJson({...doc.data(), 'id': doc.id}))
          .toList();
    } catch (e) {
      debugPrint('Error fetching all users: $e');
      return [];
    }
  }

  Future<List<TMUser>> fetchUsersByIds({required List<String> usersIds}) async {
    if (usersIds.isEmpty) return [];

    final List<TMUser> users = [];

    for (int i = 0; i < usersIds.length; i += 30) {
      final chunk = usersIds.sublist(i, (i + 30).clamp(0, usersIds.length));

      final snapshot = await firestore
          .collection('users')
          .where(FieldPath.documentId, whereIn: chunk)
          .get();

      users.addAll(
        snapshot.docs
            .map((doc) => TMUser.fromJson({...doc.data(), 'id': doc.id}))
            .toList(),
      );
    }

    return users;
  }

  Future<List<TMTaskTag>?> fetchTags() async {
    final snapshot = await firestore.collection('tags').get();
    final List<TMTaskTag> tags = [
      ...snapshot.docs.map(
        (tag) => TMTaskTag.fromJson({...tag.data(), 'id': tag.id}),
      ),
    ];
    return tags;
  }

  Future<List<TMTaskTag>> fetchProjectTags(List<String> tagsIds) async {
    try {
      final futures = await Future.wait([
        _fetchTagsByIds(tagsIds),
        _fetchDefaultTags(),
      ]);

      final List<TMTaskTag> tagsById = futures[0];
      final List<TMTaskTag> defaultTags = futures[1];

      final Map<String, TMTaskTag> tagMap = {};

      for (final tag in defaultTags) {
        tagMap[tag.id] = tag;
      }

      for (final tag in tagsById) {
        tagMap[tag.id] = tag;
      }

      final List<TMTaskTag> result = [...defaultTags];

      for (final id in tagsIds) {
        final tag = tagMap[id];
        if (tag != null && !result.any((t) => t.id == id)) {
          result.add(tag);
        }
      }
      return result;
    } catch (e) {
      debugPrint('Error in fetchProjectTags: $e');
      return [];
    }
  }

  Future<List<TMTaskTag>> _fetchTagsByIds(List<String> tagsIds) async {
    if (tagsIds.isEmpty) return [];

    final List<TMTaskTag> result = [];
    for (int i = 0; i < tagsIds.length; i += 30) {
      final end = (i + 30 < tagsIds.length) ? i + 30 : tagsIds.length;
      final chunk = tagsIds.sublist(i, end);

      final snapshot = await firestore
          .collection('tags')
          .where('id', whereIn: chunk)
          .get();

      result.addAll(
        snapshot.docs
            .map((doc) => TMTaskTag.fromJson({...doc.data(), 'id': doc.id}))
            .toList(),
      );
    }
    return result;
  }

  Future<List<TMTaskTag>> _fetchDefaultTags() async {
    final snapshot = await firestore
        .collection('tags')
        .where('is_default', isEqualTo: true)
        .get();

    return snapshot.docs
        .map((doc) => TMTaskTag.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  Future<String?> addTag({
    required TMTaskTag tag,
    required String projectId,
  }) async {
    try {
      final tagId = tag.id.isEmpty ? _uuid.v4() : tag.id;
      final batch = firestore.batch();
      final flatTagRef = firestore.collection('tags').doc(tagId);
      final projectRef = firestore.collection('projects').doc(projectId);

      batch
        ..set(flatTagRef, tag.copyWith(id: tagId).toJson())
        ..update(projectRef, {
          'tags_ids': FieldValue.arrayUnion([tagId]),
        });
      await batch.commit();
      return tagId;
    } catch (e) {
      debugPrint('Task Add Error: $e');
      return null;
    }
  }
}

import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/features/profile/view/models/user_entity.dart';

class ProfileUtils {
  static UserProfileData? profileData(TMUser? user) {
    if (user != null && user.displayName != null) {
      final displayName = user.displayName?.split(' ');

      if (displayName!.isNotEmpty) {
        return UserProfileData(
          id: user.id,
          firstName: displayName[0],
          secondName: displayName.length > 1 ? displayName[1] : '',
          profileImage: user.photoUrl,
        );
      }
    }
    return null;
  }
}

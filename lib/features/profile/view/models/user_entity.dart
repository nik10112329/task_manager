class UserProfileData {
  UserProfileData({
    required this.id,
    required this.firstName,
    required this.secondName,
    this.profileImage,
});

  String firstName;
  String id;
  String secondName;
  String? profileImage;
}

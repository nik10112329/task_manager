class RustorePushRequest {

  RustorePushRequest({required this.message});
  final RustorePushMessage message;

  Map<String, dynamic> toJson() => {
    'message': message.toJson(),
  };
}

class RustorePushMessage {

  RustorePushMessage({
    required this.token,
    required this.notification,
  });
  final String token;
  final RustorePushNotification notification;

  Map<String, dynamic> toJson() => {
    'token': token,
    'notification': notification.toJson(),
  };
}

class RustorePushNotification {

  RustorePushNotification({
    required this.title,
    required this.body,
    this.image,
  });
  final String title;
  final String body;
  final String? image;

  Map<String, dynamic> toJson() => {
    'title': title,
    'body': body,
    if (image != null) 'image': image,
  };
}

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task_manager/features/notifications/client/push_request_dto.dart';

part 'vk_notification_client.g.dart';

@RestApi(baseUrl: 'https://vkpns.rustore.ru')
abstract class VkNotificationClient {
  factory VkNotificationClient(Dio dio, {String baseUrl}) =
      _VkNotificationClient;

  @POST('/v1/project/h-NgadJY8Zc3P7gV41KfM0fwjDtQL2d3/messages:send')
  Future<void> sendPush(
    @Body() RustorePushRequest body,
  );
}

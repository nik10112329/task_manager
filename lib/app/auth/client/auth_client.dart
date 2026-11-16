import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthRestClient {
  factory AuthRestClient(Dio dio) = _AuthRestClient;

  @POST('/profile')
  Future<void> loadProfile(String token);

  @POST('/auth/login')
  Future<void> login({required String email, required String password});

  @POST('/auth/register')
  Future<void> register({
    required String email,
    required String password,
    required String name,
  });
  @POST('/refreshToken')
  Future<void> refreshToken(String token);
}

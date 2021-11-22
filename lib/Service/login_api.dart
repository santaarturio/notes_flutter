import 'package:notes/Model/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'login_api.g.dart';

@RestApi(baseUrl: 'https://notes-1ed6c.web.app/api/users')
abstract class LoginAPI {
  factory LoginAPI(Dio dio, {String baseUrl}) = _LoginAPI;

  @POST("/signup")
  Future<User> signup(@Field("name") String? name, @Field("email") String email,
      @Field("password") String password);

  @POST("/signin")
  Future<User> signin(
      @Field("email") String email, @Field("password") String password);
}

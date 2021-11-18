import 'package:notes/Model/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: 'https://notes-1ed6c.web.app/api/users')
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST("/signup")
  Future<User> signup(@Field("name") String? name, @Field("email") String email,
      @Field("password") String password);

  @POST("/signin")
  Future<User> signin(
      @Field("email") String email, @Field("password") String password);
}

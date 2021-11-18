import 'package:notes/Model/note.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part '../Misc/notes_api.g.dart';

@RestApi(baseUrl: 'https://notes-1ed6c.web.app/api')
abstract class NotesService {
  factory NotesService(Dio dio, {String baseUrl}) = _NotesService;

  static Dio dio({String? jwt, bool Function(int?)? validateStatus}) {
    return Dio(BaseOptions(
        headers: {"Authorization": "Bearer ${jwt ?? ''}"},
        validateStatus: validateStatus));
  }

  @GET("/notes")
  Future<List<Note>> notes();

  @PUT("/notes")
  Future<Note> createNote(
      @Field("title") String title, @Field("subtitle") String subtitle);
}

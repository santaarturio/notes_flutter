import 'package:notes/Model/note.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part '../Misc/notes_api.g.dart';

@RestApi(baseUrl: 'https://notes-1ed6c.web.app/api')
abstract class NotesService {
  factory NotesService(Dio dio, {String baseUrl}) = _NotesService;

  @GET("/notes")
  Future<List<Note>> notes(@Header('Authorization') String bearer);

  @PUT("/notes")
  Future<Note> createNote(@Header('Authorization') String bearer,
      @Field("title") String title, @Field("subtitle") String subtitle);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NotesAPI implements NotesAPI {
  _NotesAPI(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://notes-1ed6c.web.app/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Note>> notes(bearer) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': bearer};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Note>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/notes',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Note.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Note> createNote(bearer, title, subtitle) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': bearer};
    _headers.removeWhere((k, v) => v == null);
    final _data = {'title': title, 'subtitle': subtitle};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Note>(
        Options(method: 'PUT', headers: _headers, extra: _extra)
            .compose(_dio.options, '/notes',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Note.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

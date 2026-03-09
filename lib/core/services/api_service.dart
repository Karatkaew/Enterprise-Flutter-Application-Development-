import 'package:dio/dio.dart';

class ApiService {

  final dio = Dio();

  ApiService() {

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("REQUEST: ${options.path}");
          return handler.next(options);
        },
        onError: (e, handler) {
          print("ERROR: $e");
          return handler.next(e);
        },
      ),
    );

  }

  Future<Response> getPosts() async {
    return dio.get(
      "https://jsonplaceholder.typicode.com/posts",
    );
  }

}
import 'package:dio/dio.dart';

class Client {
  static var client = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 4),
  ));
}

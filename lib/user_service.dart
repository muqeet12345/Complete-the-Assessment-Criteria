import 'package:dio/dio.dart';

class UserService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchUsers(int page, int results) async {
    final response = await _dio.get('https://randomuser.me/api/', queryParameters: {
      'page': page,
      'results': results,
    });

    if (response.statusCode == 200) {
      return response.data['results'];
    } else {
      throw Exception('Failed to load users');
    }
  }
}

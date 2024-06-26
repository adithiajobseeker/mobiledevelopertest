import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_developer_test/models/models.dart';

class UserService {

  static Future<List<UserModel>> fetchUsers() async {
    const url = 'https://reqres.in/api/users?page=2';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['data'] as List<dynamic>;
    final transform = results.map((api){
      return UserModel(
        id: api['id'],
        email: api['email'],
        firstName: api['first_name'],
        lastName: api['last_name'],
        avatar: api['avatar'],
      );
    }).toList();
    return transform;
  }

  
}
import 'package:atalup_app/domain/post.dart';
import 'package:atalup_app/domain/user.dart';
import 'package:http/http.dart' as http;

abstract class BackendDatasource {
  Future<List<Post>> getAllPost();
  Future<List<User>> getAllUser();
}

class MyBackend extends BackendDatasource {
  // Preferences _pref = Preferences();
  String baseUrl = 'https://jsonplaceholder.typicode.com/';

  @override
  Future<List<Post>> getAllPost() async {
    var url = Uri.parse('$baseUrl/posts');
    var headers = <String, String>{
      'Content-Type': 'application/json',
    };
    http.Response response;
    try {
      response = await http.get(url, headers: headers).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          return http.Response('', 500);
        },
      );
    } catch (e) {
      response = http.Response('', 500);
    }
    if (response.statusCode == 200) {
      // La petición fue exitosa
      return postFromJson(response.body);
    } else {
      // La petición falló
      return throw 'Request Error - ${response.statusCode}';
    }
  }

  @override
  Future<List<User>> getAllUser() async {
    var url = Uri.parse('$baseUrl/users');
    var headers = <String, String>{
      'Content-Type': 'application/json',
    };
    http.Response response;
    try {
      response = await http.get(url, headers: headers).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          return http.Response('', 500);
        },
      );
    } catch (e) {
      response = http.Response('', 500);
    }
    if (response.statusCode == 200) {
      // La petición fue exitosa
      return userFromJson(response.body);
    } else {
      // La petición falló
      return throw 'Request Error - ${response.statusCode}';
    }
  }
}

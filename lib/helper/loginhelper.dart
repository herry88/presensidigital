import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginHelper {
  // String url = 'https://backendapilaravel-app.herokuapp.com/api/login';
  var status;
  var token;
  loginData(String email, String password) async {
    var response = await http.post(
      Uri.parse('https://backendapilaravel-app.herokuapp.com/api/login'),
      headers: {'Accept': 'application/json'},
      body: {'email': '$email'.toString(), 'password': '$password'.toString()},
    );
    status = response.body.contains('error');
    var data = json.decode(response.body);
    print(status);
    print(data);
    if (status) {
      // return data;
      print('data:${data['error']}');
    } else {
      print('data:${data['token']}');
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginHelper {
  String url = 'urllocalhost:8001/api/login';

  var status;
  loginData(String email, String password) async {
    var response = await http.post(
      Uri.parse(url),
      headers: {'Accept': 'application/json'},
      body: {'email': email, 'password': password},
    );
    status = response.body.contains('error');
    var data = jsonDecode(response.body);
    print(status);
    if (status) {
      // return data;
      print('data: ${data['error']}');
    } else {
      print('data:${data['status']}');
    }
  }
}

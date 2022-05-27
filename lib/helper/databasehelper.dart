import 'package:http/http.dart' as http;

class DatabaseHelper {
  // String url = "";
  //delete data
  void deleteData(int id) async {
    String myUrl =
        "https://backendapilaravel-app.herokuapp.com/api/product/$id";
    http.delete(
      Uri.parse(
        myUrl,
      ),
      headers: {'Accept': 'application/json'}).then((response){
        print(response.statusCode);
        print(response.body);
      
      });
  }
}

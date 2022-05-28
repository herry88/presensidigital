import 'package:http/http.dart' as http;

class DatabaseHelper {
  // String url = "";

  //create Data
  void addData(String nmproduct, String stock) async {
    String myUrl = "https://backendapilaravel-app.herokuapp.com/api/product";
    http.post(Uri.parse(myUrl), headers: {
      "Accept": "application/json",
    }, body: {
      "nmproduct": nmproduct,
      "stock": stock.toString(),
    }).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
  }

  //delete data
  void deleteData(int id) async {
    String myUrl =
        "https://backendapilaravel-app.herokuapp.com/api/product/$id";
    http.delete(
        Uri.parse(
          myUrl,
        ),
        headers: {'Accept': 'application/json'}).then((response) {
      print(response.statusCode);
      print(response.body);
    });
  }
}

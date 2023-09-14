import 'dart:convert';
import 'package:bulky_front_end/Models/Category.dart';
import 'package:bulky_front_end/Models/Product.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  //the URL of the API
  //static String studentUrl = 'https://10.0.2.2:7036/api/student'; //FOR ENULATIOR
  static String productUrl = 'https://localhost:7013/api/product'; //FOR Web app
  //static String studentUrl = 'https://192.168.2.211:8000/api/category';
  //static String studentUrl = 'https://jsonplaceholder.typicode.com/users';

  //Fetch all the students
  static Future fetchProduct() async {
    try {
      return await http.get(Uri.parse(productUrl), headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*',
      });
    } catch (e) {
      print(e.toString());
    }
  }

  static Map<String, String> header = {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*',
  };

  //Add Student
  static Future<bool> addProduct(Product product) async {
    try {
      //converting to map in flutter
      var ProductAsMap = product.toMap();
      //converting to Json for the API
      var myProductAsJson = jsonEncode(ProductAsMap);
      var response = await http.post(
        Uri.parse(
          productUrl,
        ),
        headers: header, //the header
        body: myProductAsJson, //the new student info
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("\n\n\nerror\n\n${e.toString()}");
      return false;
    }
  }

  //Delete Student
  static Future<bool> deleteProduct(int id) async {
    var response = await http.delete(
      Uri.parse(
          '$productUrl/$id'), // bacause when You add the id , the backend will understand it is a delete not add or get
      headers: header,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

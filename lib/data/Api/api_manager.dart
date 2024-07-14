import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:route_tech_summit_task/data/model/ProductResponceDTO.dart';
import 'package:route_tech_summit_task/domain/Exceptions/server_error.dart';
class ApiManager
{
   Future<ProductsResponceDTO>getProducts() async {

    final response= await  http.get(Uri.parse('https://dummyjson.com/products'));
    if(response.statusCode==200){
      final responseBody = jsonDecode(response.body);
      return ProductsResponceDTO.fromJson(responseBody);
    }
    else{
      throw ServerError('Failed to call api');
    }
  }

}
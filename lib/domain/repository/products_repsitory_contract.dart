

import 'package:route_tech_summit_task/data/model/ProductResponceDTO.dart';
import 'package:route_tech_summit_task/domain/model/ProductResponce.dart';
import 'package:route_tech_summit_task/domain/model/product.dart';

abstract class ProductsRepository{

   Future<List<Product>?>getProducts();
}

abstract class ProductsDataSource{

   Future<ProductsResponce>getProducts();
}
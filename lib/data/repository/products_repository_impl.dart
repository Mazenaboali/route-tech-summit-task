
import 'package:route_tech_summit_task/data/model/productDTO.dart';
import 'package:route_tech_summit_task/domain/model/product.dart';
import 'package:route_tech_summit_task/domain/repository/products_repsitory_contract.dart';

class ProductsRepositoryImpl implements ProductsRepository{
  ProductsDataSource productRemoteDataSource;
  ProductsRepositoryImpl(this.productRemoteDataSource);

  @override
  Future<List<Product>?> getProducts() async{
    var response= await productRemoteDataSource.getProducts();
    return response.products;

  }

}
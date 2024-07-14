import 'package:route_tech_summit_task/domain/model/product.dart';
import 'package:route_tech_summit_task/domain/repository/products_repsitory_contract.dart';

class GetProductsUseCase{
  ProductsRepository productsRepository;
  GetProductsUseCase(this.productsRepository);
  Future<List<Product>?> invoke()async{
   var products=await productsRepository.getProducts();
   return products;
  }
}
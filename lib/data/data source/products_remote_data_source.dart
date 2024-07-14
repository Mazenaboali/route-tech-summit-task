
import 'package:route_tech_summit_task/data/Api/api_manager.dart';
import 'package:route_tech_summit_task/data/model/ProductResponceDTO.dart';
import 'package:route_tech_summit_task/domain/model/ProductResponce.dart';
import 'package:route_tech_summit_task/domain/repository/products_repsitory_contract.dart';

class ProductsRemoteDataSource implements ProductsDataSource {
  ApiManager apiManager;

  ProductsRemoteDataSource(this.apiManager);

  @override
  Future<ProductsResponce> getProducts() async{
    // TODO: implement getProducts

    var response = await apiManager.getProducts();
    return response.ToDomainProductsResponce();
  }
}

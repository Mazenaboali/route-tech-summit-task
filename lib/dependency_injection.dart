
import 'package:route_tech_summit_task/data/Api/api_manager.dart';
import 'package:route_tech_summit_task/data/data%20source/products_remote_data_source.dart';
import 'package:route_tech_summit_task/data/repository/products_repository_impl.dart';
import 'package:route_tech_summit_task/domain/repository/products_repsitory_contract.dart';
import 'package:route_tech_summit_task/domain/use%20cases/get_products.dart';

ProductsRepository getProductsRepository(ProductsDataSource productRemoteDataSource){
  return ProductsRepositoryImpl(productRemoteDataSource);

}
ProductsDataSource getProductsRemoteDataSource(ApiManager apiManager){
  return ProductsRemoteDataSource(apiManager);
}
ApiManager getApiManager(){
  return ApiManager();
}
ProductsRepository ProductsRepoInjection(){
  return getProductsRepository(getProductsRemoteDataSource(getApiManager()));
}
GetProductsUseCase injectGetProductsUseCase(){
  return GetProductsUseCase(ProductsRepoInjection());
}
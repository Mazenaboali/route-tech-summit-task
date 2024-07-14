import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_tech_summit_task/data/model/productDTO.dart';
import 'package:route_tech_summit_task/domain/Exceptions/server_error.dart';
import 'package:route_tech_summit_task/domain/model/product.dart';
import 'package:route_tech_summit_task/domain/repository/products_repsitory_contract.dart';
import 'package:route_tech_summit_task/domain/use%20cases/get_products.dart';

class ProductsListScreenViewModel extends Cubit<ProductsListState> {
  GetProductsUseCase getProductsUseCase;
  ProductsListScreenViewModel(this.getProductsUseCase)
      : super(LoadingState() as ProductsListState);
  void LoadProducts() async {
    try {
      var products = await getProductsUseCase.invoke();
      if (products == null) {
        emit(ErrorState('can not reach to the products'));
      } else {
        emit(ProductsLoadedState(products));
      }
    } catch (e) {
      if(e is ServerError) {
        emit(ErrorState('Error getting Products ${e.toString()}'));
      }
      else{
        emit(ErrorState('Error loading Products ${e.toString()}'));
      }
    }
  }
}

abstract class ProductsListState {}

class LoadingState extends ProductsListState {}

class ProductsLoadedState extends ProductsListState {
  List<Product>? productsList;
  ProductsLoadedState(this.productsList);
}

class ErrorState extends ProductsListState {
  String? errormessage;
  ErrorState(this.errormessage);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_tech_summit_task/Presentation/components/product_widget.dart';
import 'package:route_tech_summit_task/dependency_injection.dart';
import 'package:route_tech_summit_task/Presentation/products_list_screen_view_model.dart';

class ProductsListScreen extends StatefulWidget {
  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  TextEditingController textEditingController =TextEditingController();

  ProductsListScreenViewModel viewModel = ProductsListScreenViewModel(injectGetProductsUseCase());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.LoadProducts();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/route.png',
          width: 66,
          height: 22,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 330,
                  height: 50,
                  child: TextFormField(
                     onChanged: (String? value){
                     },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(

                          color: Colors.grey,
                          fontSize: 14
                        ),

                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff004182)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: 'what do you search for?',
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon:Icon(Icons.search,color: Color(0xff004182), size: 21,),
                        alignLabelWithHint: true,
                      )
                  )
                ),
              ),
              Container(
                width: 10,
              ),
              Image.asset(
                'assets/images/shopping-icon.png',
                width: 24,
                height: 24,
              )
            ],
          ),
          Container(
            child: BlocBuilder<ProductsListScreenViewModel, ProductsListState>(
                bloc: viewModel,
                builder: (context, state) {
                  // return widget here based on BlocA's state
                  if (state is LoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ProductsLoadedState) {
                    print(state.productsList);
                    return Expanded(
                      child: GridView.count(
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        shrinkWrap: true,
                        crossAxisCount: 2, // Number of columns in the grid
                        children: List.generate(state.productsList?.length ?? 0,
                            (index) {
                          return ProductWidget(
                              product: state.productsList![index]);
                        }),
                      ),
                    );
                  }
                  else{
                    return Container();
                  }
                }),
          )
        ],
      ),
    );
  }
}

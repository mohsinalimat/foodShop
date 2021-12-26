import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinefooddeliverysystem/constant/colors.dart';
import 'package:onlinefooddeliverysystem/controllers/product/product_cubit.dart';
import 'package:onlinefooddeliverysystem/models/category_model.dart';
import 'package:onlinefooddeliverysystem/views/app/components/app_components.dart';
import 'package:onlinefooddeliverysystem/views/components/standard_products_widget.dart';

class OneCategoryScreen extends StatelessWidget {
  const OneCategoryScreen({Key? key, required this.category}) : super(key: key);
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    ProductCubit productCubit = BlocProvider.of<ProductCubit>(context)
      ..getSelectedProductByCategory(categoryId: category.categoryId);
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ///
          //////////////////////// List of Products ////////////////////////
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (productCubit.selectedProductByCat.isNotEmpty) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top + 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ProductCardListWidget(
                          currencyCode: 'EGP',
                          products:
                              context.read<ProductCubit>().selectedProductByCat,
                          addCartEnabled: true,
                          dissmissEnabled: false,
                          favEnabled: true,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 10,
                      )
                    ],
                  ),
                );
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.exclamationmark_circle),
                    Text("No Products for selected Category.."),
                  ],
                ),
              );
            },
          ),

          ///
          //////////////////////// Red Banner - title & Back button - ////////////////////////
          TitleSliderWidget(
            titleTxt: category.title,
            prefixIcon: SizedBox(),
            backAvaiable: true,
          ),
        ],
      ),
    );
  }
}


//KlEDKPmbNr7iMV2xvarS
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinefooddeliverysystem/constant/colors.dart';
import 'package:onlinefooddeliverysystem/models/product_model.dart';

///////////////////////         ADD TO CART Button    ///////////////////////////////
class AddCartButtonWidget extends StatelessWidget {
  const AddCartButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoButton(
          color: mainColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_cart,
                color: whiteColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text("add to Cart",
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      // fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: whiteColor)),
            ],
          ),
          onPressed: () {
            print("add to cart");
          }),
    );
  }
}

///////////////////////         ADD FAV Button    //////////////////////////////////
class AddFavButtonWidget extends StatelessWidget {
  const AddFavButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Like");
      },
      child: Container(
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: mainColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border,
                color: mainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////        BackGroung Image    //////////////////////////////////
class ImageBGWidget extends StatelessWidget {
  const ImageBGWidget({
    Key? key,
    required this.product,
    required this.imageHeight,
    required this.imagewidth,
  }) : super(key: key);

  final double imageHeight;
  final double imagewidth;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: imageHeight,
          width: imagewidth,
          child: CachedNetworkImage(
            imageUrl: product.imageUrl,
            fit: BoxFit.cover,
            //width: mediaQuery.size.width,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - imagewidth,
          height: MediaQuery.of(context).size.height - imageHeight,
          color: backgroundColor,
        ),
      ],
    );
  }
}

///////////////////////        FUncation to Calculte Sale Rate     //////////////////////////////////
offRate({required double preNumber, required double currentNumber}) {
  return (((preNumber - currentNumber) / preNumber) * 100).ceil().toString();
}
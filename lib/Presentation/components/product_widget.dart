import 'package:flutter/material.dart';
import 'package:route_tech_summit_task/data/model/productDTO.dart';
import 'package:route_tech_summit_task/domain/model/product.dart';

class ProductWidget extends StatelessWidget{
  Product product;

  ProductWidget( {required this.product});

  @override
  Widget build(BuildContext context) {
    num discountpercentage=product.discountPercentage??0;

    num oldPrice=(product.price??0).ceil();

   late num officialPrice=   ( oldPrice - ((discountpercentage*oldPrice)/100));
    // TODO: implement build
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 237,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0x4D004182),
            ),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
               product.images?[0]==null?Container(
                 height: 128,
                 width: 191,
               ):  Image.network(
                  product.images![0],
                  height: 128,
                  width: 191,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(width: 5,),
                    Image.asset('assets/images/favourite-icon.png',width: 50,height: 50,),
                  ],
                )

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(

                overflow: TextOverflow.ellipsis,
                product.title??"",
                style: TextStyle(
                  color: Color(0xff06004F),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                product.description??"",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xff06004F),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                 ' EGP ${officialPrice.toInt()}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff06004F),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        '${oldPrice} EGP',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0x99004182),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 49,
                        color: Color(0x99004182),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'Review',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff06004F),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  width: 5,
                ),
                Text(
                  '(${product.rating??0})',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xff06004F),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Icon(
                    Icons.star,
                    color: Color(0xffFDD835),
                  ),
                ),
                Container(
                  width: 10,
                ),
                Image.asset(
                  'assets/images/plus-icon.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'dart:convert';
import 'dart:io';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppingApp/presentation/core/konstants.dart';
import 'package:shoppingApp/presentation/dashboard/shop/model/product.dart';

class ShopItemCard extends StatefulWidget {
  final ProductModel product;
  const ShopItemCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  _ShopItemCardState createState() => _ShopItemCardState();
}

class _ShopItemCardState extends State<ShopItemCard> {
  bool isFavorite = false;
  final double buttonWidth = 40;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            // onTap: () => ExtendedNavigator.of(context).push(
            //   Routes.detailsScreen,
            //   arguments: DetailsScreenArguments(
            //     product: widget.product,
            //   ),
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Ink.image(
                            image: CachedNetworkImageProvider(
                              widget.product.image,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            color: kSecondaryColor,
                          ),
                          child: Text(
                            "${widget.product.discountName}%",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Colors.red,
                          ),
                          child: Text(
                            'New',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: -10,
                        bottom: -10,
                        child: IconButton(
                          icon: Icon(isFavorite
                              ? Icons.favorite
                              : Icons.favorite_outline),
                          color: isFavorite ? Colors.red : Colors.grey,
                          onPressed: () async {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                            await FlushbarHelper.createSuccess(
                                    message:
                                        '${widget.product.title} ${isFavorite ? 'added to' : 'removed from'} favourite')
                                .show(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ), // //

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    widget.product.title ?? 'Title',
                    style: Theme.of(context).textTheme.subtitle2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    widget.product.description ?? 'Description',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBarIndicator(
                        // rating: 3,
                        rating: double.tryParse('4.3' ?? '0'),
                        itemSize: 16,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) => Icon(
                          Icons.star_rounded,
                          color: kSecondaryColor,
                        ),
                      ),
                      Image.asset(
                        'assets/veg60.png',
                        color: '3' == "0" ? Colors.green : Colors.red,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹ Old Price',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        '₹ Price ',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),

                Material(
                  color: Theme.of(context).accentColor,
                  child: InkWell(
                    onTap: () async {
                      await FlushbarHelper.createSuccess(
                              message: ' added to cart')
                          .show(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      // height: buttonWidth,
                      height: MediaQuery.of(context).size.height / 23,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.cartPlus,
                            color: Colors.white,
                          ),
                          VerticalDivider(),
                          Text(
                            'Add to cart'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // FlatButton(
                //   // minWidth: double.infinity,
                //   onPressed: () {},
                //   child: Text('Add to cart'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
    //   Card(
    //   color: ShopColors.whiteSecond,
    //   elevation: 4,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(10)),
    //   ),
    //   child: Stack(
    //     children: [
    //       Container(
    //         height: 300,
    //         decoration: BoxDecoration(
    //           color: ShopColors.whiteSecond,
    //           borderRadius: BorderRadius.all(Radius.circular(10)),
    //         ),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                 color: Colors.red,
    //                 borderRadius: BorderRadius.all(Radius.circular(10)),
    //               ),
    //               height: 190,
    //               width: double.infinity,
    //               child: Center(
    //                 child: Text('Image here'),
    //               ),
    //             ),
    //             Container(height: 8),
    //             RatingBarIndicator(
    //               // rating: 3,
    //               rating: double.tryParse('3.5'),
    //               itemSize: 16,
    //               direction: Axis.horizontal,
    //               itemCount: 5,
    //               itemBuilder: (BuildContext context, int index) => Icon(
    //                 Icons.star_rounded,
    //                 color: ShopColors.orange,
    //               ),
    //             ),
    //             Container(height: 8),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 3.0),
    //               child: Text(
    //                 'Title',
    //                 style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //                 maxLines: 2,
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 3.0),
    //               child: Text(
    //                 'Subtitle',
    //                 maxLines: 2,
    //                 overflow: TextOverflow.ellipsis,
    //                 style: TextStyle(
    //                   fontSize: 16,
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 3.0),
    //               child: Text(
    //                 '₹ ' + 'Price',
    //                 style: TextStyle(
    //                   color: Colors.green,
    //                   fontWeight: FontWeight.bold,
    //                   // decoration: TextDecoration.underline,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Positioned(
    //         right: 5,
    //         bottom: 112,
    //         child: Container(
    //           decoration: BoxDecoration(
    //             color: ShopColors.whiteSecond,
    //             shape: BoxShape.circle,
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Colors.grey,
    //                 offset: Offset(0.0, 1.0), //(x,y)
    //                 blurRadius: 6.0,
    //               ),
    //             ],
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(5.0),
    //             child: Icon(
    //               CupertinoIcons.heart,
    //               color: Colors.grey,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

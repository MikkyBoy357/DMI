import 'dart:convert';
import 'dart:io';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppingApp/presentation/core/konstants.dart';
import 'package:shoppingApp/presentation/dashboard/shop/components/shopModalSheet.dart';
import 'package:shoppingApp/presentation/dashboard/shop/model/product.dart';
import 'package:shoppingApp/presentation/dashboard/widgets/product_grid_item.dart';
import 'package:shoppingApp/presentation/dashboard/widgets/search_bar.dart';
import 'package:shoppingApp/presentation/dashboard/widgets/top_product.dart';

import 'components/shop_item_card.dart';
import 'components/sort_tile.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List results = List();

  getProducts() async {
    FormData formData = new FormData.fromMap({'user_id': 16});
    Dio dio = new Dio();
    dio.options.headers["authorization"] =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2IiwibmFtZSI6IktyaXNoYW55YWRhdiIsImVtYWlsIjoieWFkYXZiYWxrcmlzaGFuLjIwQGdtYWlsLmNvbSIsImNyZWF0ZWRfYXQiOiIyMDIxLTAzLTI0IDExOjI5OjA5IiwidGltZSI6MTYxNjY3MjEwNX0.ViElXIhCgeGesBTaX43z6tniy049Yp0EPe0D447z8q8";
    dio.options.headers['device_id'] = 123456;
    dio.options.headers['device_version'] = 1;
    dio.options.headers['device_type'] = 1;
    dio.options.headers['store_id'] = 14;
    var response = await dio.post(
      'http://4percentmedical.com/dks/grocery/Api/Restapi/getProducts',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: formData,
    );
    results = jsonDecode(response.data)['responsedata'];
    print(' HERE');
    print(results);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    // getProducts();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          // color: Colors.red,
          child: Column(
            children: [
              Container(height: 30),
              SearchBar(),
              Container(height: 8),
              // Categories
              Container(
                height: 50,
                // color: Colors.green,
                child: Row(
                  children: [
                    SortTile(),
                    SortTile(),
                    SortTile(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  height: 40,
                  // color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return DraggableScrollableSheet(
                              expand: true,
                              initialChildSize: 0.95,
                              maxChildSize: 1,
                              minChildSize: 0.95,
                              builder: (BuildContext context,
                                  ScrollController scrollController) {
                                return ShopModalSheet();
                              },
                            );
                          },
                        ),
                        child: Container(
                          width: 85,
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.filter),
                              Text(
                                'Filter',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 90.0),
                        child: Container(
                          width: 85,
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.filter),
                              Text(
                                'Text ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Icon(Icons.list),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(150),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
        child: GridView.builder(
          itemCount: results.length ?? 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.55,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            ProductModel product = ProductModel.fromJson(results[index]);
            return ShopItemCard(
              product: product,
            );
          },
        ),
      ),
    );
  }
}

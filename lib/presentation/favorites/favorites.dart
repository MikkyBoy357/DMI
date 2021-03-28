import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'widgets/favorite_list_item.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List results = List();

  getWishList() async {
    FormData formData = new FormData.fromMap({'user_id': 16});
    Dio dio = new Dio();
    dio.options.headers["authorization"] =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2IiwibmFtZSI6IktyaXNoYW55YWRhdiIsImVtYWlsIjoieWFkYXZiYWxrcmlzaGFuLjIwQGdtYWlsLmNvbSIsImNyZWF0ZWRfYXQiOiIyMDIxLTAzLTI2IDA3OjQyOjQ3IiwidGltZSI6MTYxNjg2NjA0Mn0.S6MPcIlZZrmcdF7ZTKVsrvIePmDNZcc8z1nSnoRFXSs";
    dio.options.headers['device_id'] = 123456;
    dio.options.headers['device_version'] = 1;
    dio.options.headers['device_type'] = 1;
    dio.options.headers['store_id'] = 14;
    var response = await dio.post(
      'http://4percentmedical.com/dks/grocery/Api/Restapi/wishList',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: formData,
    );
    results = jsonDecode(response.data)['responsedata'][0];
    print(' HERE');
    print(results);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWishList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            return FavoriteListItem(
              title: results[index]['title'],
              oldPrice: results[index]['old_price'],
              price: results[index]['price'],
              image: results[index]['image'],
            );
          },
        ),
      ),
    );
  }
}

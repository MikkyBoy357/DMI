import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoppingApp/presentation/common_widget/custom_button.dart';
import 'package:shoppingApp/presentation/common_widget/text_field_widget.dart';
import 'package:shoppingApp/presentation/common_widget/text_style.dart';

import 'model/product.dart';

class MyAddress extends StatefulWidget {
  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  // getAddress() async {
  //   FormData formData = new FormData.fromMap({'user_id': 16});
  //   Dio dio = new Dio();
  //   dio.options.headers["authorization"] =
  //       "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2IiwibmFtZSI6IktyaXNoYW55YWRhdiIsImVtYWlsIjoieWFkYXZiYWxrcmlzaGFuLjIwQGdtYWlsLmNvbSIsImNyZWF0ZWRfYXQiOiIyMDIxLTAzLTIzIDIzOjExOjU2IiwidGltZSI6MTYxNjU3MDU0OX0.fzhYyBgUe6fELqDG-iBggSr8s830O5kqOMF-i4UoaBM";
  //   dio.options.headers['device_id'] = 123456;
  //   dio.options.headers['device_version'] = 1;
  //   dio.options.headers['device_type'] = 1;
  //   dio.options.headers['store_id'] = 14;
  //   var response = await dio.post(
  //     'http://4percentmedical.com/dks/grocery/Api/Restapi/addressList',
  //     options: Options(headers: {
  //       HttpHeaders.contentTypeHeader: "application/json",
  //     }),
  //     data: formData,
  //   );
  //   var results = jsonDecode(response.data);
  //   print(results['responsedata'][0][1]['address']);
  // }
  List results = List();

  getAddress() async {
    FormData formData = new FormData.fromMap({'user_id': 16});
    Dio dio = new Dio();
    dio.options.headers["authorization"] =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2IiwibmFtZSI6IktyaXNoYW55YWRhdiIsImVtYWlsIjoieWFkYXZiYWxrcmlzaGFuLjIwQGdtYWlsLmNvbSIsImNyZWF0ZWRfYXQiOiIyMDIxLTAzLTI2IDA3OjQyOjQ3IiwidGltZSI6MTYxNjg2NjA0Mn0.S6MPcIlZZrmcdF7ZTKVsrvIePmDNZcc8z1nSnoRFXSs";
    dio.options.headers['device_id'] = 123456;
    dio.options.headers['device_version'] = 1;
    dio.options.headers['device_type'] = 1;
    dio.options.headers['store_id'] = 14;
    var response = await dio.post(
      'http://4percentmedical.com/dks/grocery/Api/Restapi/addressList',
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

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    getAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "My Address",
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.black,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    title: Text('Add Todolist'),
                    content: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldWidget(
                              textelements: "Name of Customer",
                              prefixIcon: Icons.supervisor_account_sharp,
                            ),
                            SizedBox(height: 10),
                            TextFieldWidget(
                              textelements: "Addresss",
                              prefixIcon: Icons.maps_ugc_rounded,
                            ),
                            SizedBox(height: 10),
                            TextFieldWidget(
                              textelements: "City name",
                              prefixIcon: Icons.maps_ugc_rounded,
                            ),
                            SizedBox(height: 10),
                            TextFieldWidget(
                                textelements: "Mobile Number",
                                prefixIcon: Icons.mobile_friendly_outlined),
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (_) {
                                    setState(() {
                                      isChecked = !isChecked;
                                    });
                                  },
                                ),
                                Text("make default",
                                    style: Constants.appBarHeading)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          // createTodos();
                          Navigator.pop(context);
                        },
                        child: Text('Add'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 250,
              child: Flexible(
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.more_horiz),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      key: Key(
                          "${AddressModel.fromJson(results[index]).address.trim()}"),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.maps_ugc_rounded,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${AddressModel.fromJson(results[index]).id}',
                                        style: Constants.appBarHeading),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          120,
                                      child: Text(
                                        "${AddressModel.fromJson(results[index]).address.trim()}, "
                                        "${AddressModel.fromJson(results[index]).city.trim()}, "
                                        "${AddressModel.fromJson(results[index]).city},"
                                        " ${AddressModel.fromJson(results[index]).state}",
                                        maxLines: 4,
                                        style: TextStyle(
                                            color: Color(0xAAA3a3a43),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    // Text("${AddressModel.fromJson(results[0]).city}",
                                    //     style: Constants.subtextHeading),
                                    // Text("${AddressModel.fromJson(results[0]).state}",
                                    //     style: Constants.subtextHeading),
                                    // Text("${AddressModel.fromJson(results[0]).state}",
                                    //     style: Constants.subtextHeading),
                                    Text(
                                        "${AddressModel.fromJson(results[index]).pincode}",
                                        style: Constants.appBarHeading),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            // Container(
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(22), color: Colors.white),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         TextFieldWidget(
            //           textelements: "Name of Customer",
            //           prefixIcon: Icons.supervisor_account_sharp,
            //         ),
            //         SizedBox(height: 10),
            //         TextFieldWidget(
            //           textelements: "Addresss",
            //           prefixIcon: Icons.maps_ugc_rounded,
            //         ),
            //         SizedBox(height: 10),
            //         TextFieldWidget(
            //           textelements: "City name",
            //           prefixIcon: Icons.maps_ugc_rounded,
            //         ),
            //         SizedBox(height: 10),
            //         TextFieldWidget(
            //             textelements: "Mobile Number",
            //             prefixIcon: Icons.mobile_friendly_outlined),
            //         Row(
            //           children: [
            //             Checkbox(
            //               value: isChecked,
            //               onChanged: (_) {
            //                 setState(() {
            //                   isChecked = !isChecked;
            //                 });
            //               },
            //             ),
            //             Text("make default", style: Constants.appBarHeading)
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),

            Column(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25),
        child: CustomFullWidthButton(
          text: "Save Setting",
          fillcolor: Color(0xff6cc41d),
          textcolor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}

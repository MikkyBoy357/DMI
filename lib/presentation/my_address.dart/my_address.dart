import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../common_widget/custom_button.dart';
import '../common_widget/text_field_widget.dart';
import '../common_widget/text_style.dart';

class MyAddress extends StatefulWidget {
  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  getAddress() async {
    FormData formData = new FormData.fromMap({'user_id': 16});
    Dio dio = new Dio();
    dio.options.headers["authorization"] =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2IiwibmFtZSI6IktyaXNoYW55YWRhdiIsImVtYWlsIjoieWFkYXZiYWxrcmlzaGFuLjIwQGdtYWlsLmNvbSIsImNyZWF0ZWRfYXQiOiIyMDIxLTAzLTIzIDIzOjExOjU2IiwidGltZSI6MTYxNjU3MDU0OX0.fzhYyBgUe6fELqDG-iBggSr8s830O5kqOMF-i4UoaBM";
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
    var results = jsonDecode(response.data);
    print(results['responsedata'][0][1]['address']);
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    getAddress();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "My Address",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
                      Text("Willam Crown", style: Constants.appBarHeading),
                      Text("Address of person\nCitiname of person",
                          style: Constants.subtextHeading),
                      Text("+1 202 555 0142", style: Constants.appBarHeading),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22), color: Colors.white),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
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
                        Text("make default", style: Constants.appBarHeading)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomFullWidthButton(
              text: "Save Setting",
              fillcolor: Color(0xff6cc41d),
              textcolor: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

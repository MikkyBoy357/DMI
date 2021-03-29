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
//
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:shoppingApp/presentation/profile/my_address.dart/my_address.dart';
//
// import '../auth/common/signout_dialog.dart';
// import '../common_widget/profile_pic_upload.dart';
// import '../core/app_router.gr.dart';
//
// class FavoritesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 200,
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       bottom: 0,
//                       child: Container(
//                         height: 100,
//                         width: MediaQuery.of(context).size.width,
//                         color: Colors.blueGrey[100],
//                       ),
//                     ),
//                     Center(
//                       child: ProfilePicUpload(),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 color: Colors.blueGrey[100],
//                 child: Column(
//                   children: [
//                     Text(
//                       'Jsessica Simpson',
//                       style: Theme.of(context).textTheme.headline5,
//                     ),
//                     Text(
//                       'sjsessica@gmail.com',
//                       style: Theme.of(context).textTheme.caption,
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(16.0),
//                 color: Colors.blueGrey[100],
//                 child: Material(
//                   color: Colors.blueGrey[100],
//                   child: Column(
//                     children: [
//                       InkWell(
//                         onTap: () => ExtendedNavigator.of(context)
//                             .push(Routes.aboutMePage),
//                         child: ListTile(
//                           leading: Icon(Icons.person_outline,
//                               color: Theme.of(context).accentColor),
//                           title: Text('About Me'),
//                           trailing: Icon(Icons.navigate_next_outlined),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () =>
//                             ExtendedNavigator.of(context).push(Routes.cartPage),
//                         child: ListTile(
//                           leading: Icon(Icons.shopping_bag_outlined,
//                               color: Theme.of(context).accentColor),
//                           title: Text('My Orders'),
//                           trailing: Icon(Icons.navigate_next_outlined),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () => ExtendedNavigator.of(context)
//                             .push(Routes.reviewPage),
//                         child: ListTile(
//                           leading: Icon(Icons.rate_review_rounded,
//                               color: Theme.of(context).accentColor),
//                           title: Text('My Reviews'),
//                           trailing: Icon(Icons.navigate_next_outlined),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () => ExtendedNavigator.of(context)
//                             .push(Routes.favoritesPage),
//                         child: ListTile(
//                           leading: Icon(Icons.favorite_border_outlined,
//                               color: Theme.of(context).accentColor),
//                           title: Text('My Favorites'),
//                           trailing: Icon(Icons.navigate_next_outlined),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () =>
//                             // ExtendedNavigator.of(context).push(Routes.myAddress),
//                             MaterialPageRoute(
//                           builder: (context) {
//                             return MyAddress();
//                           },
//                         ),
//                         child: ListTile(
//                           leading: Icon(Icons.location_city_sharp,
//                               color: Theme.of(context).accentColor),
//                           title: Text('My Address'),
//                           trailing: Icon(Icons.navigate_next_outlined),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: ListTile(
//                           leading: Icon(Icons.credit_card_outlined,
//                               color: Theme.of(context).accentColor),
//                           title: Text('Credit Card'),
//                           trailing: Icon(Icons.navigate_next_outlined),
//                         ),
//                       ),
//                       // InkWell(
//                       //   onTap: () {},
//                       //   child: ListTile(
//                       //     leading: Icon(Icons.person_outline,
//                       //         color: Theme.of(context).accentColor),
//                       //     title: Text('Transaction'),
//                       //     trailing: Icon(Icons.navigate_next_outlined),
//                       //   ),
//                       // ),
//                       InkWell(
//                         onTap: () => ExtendedNavigator.of(context)
//                             .push(Routes.notificationsPage),
//                         child: ListTile(
//                           leading: Icon(Icons.notification_important_outlined,
//                               color: Theme.of(context).accentColor),
//                           title: Text('Notification'),
//                           trailing: Icon(Icons.navigate_next_outlined),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: ListTile(
//                           leading: Icon(Icons.category_outlined,
//                               color: Theme.of(context).accentColor),
//                           title: Text('Categories'),
//                           trailing: Icon(Icons.navigate_next_outlined),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return BlurryDialog(
//                                 title: "Logout",
//                                 content: "Are you sure you want to Logout?",
//                               );
//                             },
//                           );
//                         },
//                         child: ListTile(
//                           leading: Icon(Icons.login_outlined,
//                               color: Theme.of(context).accentColor),
//                           title: Text('Sign Out'),
//                           trailing: Icon(Icons.navigate_next_outlined),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

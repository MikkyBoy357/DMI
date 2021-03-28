import 'package:flutter/material.dart';
import 'package:shoppingApp/presentation/bottom_bar.dart';
import 'package:shoppingApp/presentation/cart/cart_page.dart';
import 'package:shoppingApp/presentation/dashboard/dashboard_page.dart';
import 'package:shoppingApp/presentation/favorites/favorites.dart';
import 'package:shoppingApp/presentation/profile/profile_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedItem = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _selectedItem = index;
            print(_selectedItem);
          });
        },
        children: [
          DashboardPage(),
          Center(child: Text('Search')),
          CartPage(),
          FavoritesPage(),
          ProfilePage(),
        ],
        controller: _pageController,
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(
            () {
              _selectedItem = index;
              _pageController.animateToPage(_selectedItem,
                  duration: Duration(milliseconds: 200), curve: Curves.linear);
            },
          );
        },
      ),
    );
  }
}

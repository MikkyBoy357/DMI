import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function onTap;
  const BottomBar({
    Key key,
    this.currentIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(CupertinoIcons.search),
        ),
        BottomNavigationBarItem(
          label: 'Cart',
          icon: Icon(Icons.shopping_cart_outlined),
        ),
        BottomNavigationBarItem(
          label: 'More',
          icon: Icon(Icons.favorite_border_outlined),
        ),
        BottomNavigationBarItem(
          label: 'More',
          icon: Icon(CupertinoIcons.profile_circled),
        ),
      ],
    );
  }
}

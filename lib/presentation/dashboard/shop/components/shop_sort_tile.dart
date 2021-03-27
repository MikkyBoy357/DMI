import 'package:flutter/material.dart';

class ShopSortTile extends StatelessWidget {
  final Color backgroundColor;
  const ShopSortTile({
    Key key,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: 55,
      child: Row(
        children: [
          Container(width: 20),
          Text(
            'Popular',
            style: TextStyle(
              fontSize: 20,
              // color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

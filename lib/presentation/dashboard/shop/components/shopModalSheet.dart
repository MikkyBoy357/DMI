import 'package:flutter/material.dart';
import 'package:shoppingApp/presentation/dashboard/shop/components/shop_sort_tile.dart';

class ShopModalSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  height: 8,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                Text(
                  'Sort by',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                ShopSortTile(),
                ShopSortTile(),
                ShopSortTile(),
                ShopSortTile(),
                ShopSortTile(),
                Container(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

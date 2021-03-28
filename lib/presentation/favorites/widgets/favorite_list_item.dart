import 'package:flutter/material.dart';

class FavoriteListItem extends StatelessWidget {
  final String title;
  final String oldPrice;
  final String price;
  final String image;
  const FavoriteListItem({
    Key key,
    this.title,
    this.oldPrice,
    this.price,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(18.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                image,
                height: 120,
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.red,
                      width: 140,
                      child: Text(
                        title.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "₹ $price",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Text(
                      "1 kg",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            // color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.13,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // margin: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

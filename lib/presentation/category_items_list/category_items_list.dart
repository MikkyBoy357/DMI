import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingApp/application/dashboard/dashboard_bloc.dart';
import '../dashboard/widgets/product_grid_item.dart';

class CategoryItemsList extends StatelessWidget {
  final String categoryName;

  const CategoryItemsList({Key key, this.categoryName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            return Container();
            // return state.map(
            //   loading: (_) {
            //     return CircularProgressIndicator();
            //   },
            //   failure: (_) {
            //     return Text('Something error occured');
            //   },
            //   loaded: (s) {
            //     return GridView.builder(
            //       itemCount: s.productList.length,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         childAspectRatio: 0.55,
            //         crossAxisSpacing: 10,
            //         mainAxisSpacing: 10,
            //       ),
            //       itemBuilder: (_, index) {
            //         return FeaturedProductGridItem(
            //           featuredProductElement: s.productList[index],
            //         );
            //       },
            //     );
            //   },
            // );
          },
        ),
      ),
    );
  }
}

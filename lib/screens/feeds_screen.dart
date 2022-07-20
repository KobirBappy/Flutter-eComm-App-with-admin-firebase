import 'package:flutter/material.dart';
import 'package:flutter_shop_cpt21/Widgets/feeds_product.dart';
import 'package:flutter_shop_cpt21/models%20&%20providers/product.dart';
import 'package:provider/provider.dart';

import '../models & providers/product.dart';


class FeedScreen extends StatelessWidget {
  static const routeName = '/Feed-screen';
   FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

Provider.of<ProductProvider>(context, listen: false);

  // final ProductProvider = Provider.of<ProductProvider>(context,listen: false);

List<Product> productsList = ProductProvider().products();

final popular = ModalRoute.of(context)!.settings.arguments.toString();

if (popular == 'popular') {
  productsList = ProductProvider().PopularProducts;
}

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Feed')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: productsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (ctx, i) {
              return ChangeNotifierProvider.value(
                value: productsList[i],
                child: FeedsProducts(
                  // id: productsList[i].id,
                  // description: productsList[i].description,
                  // imageUrl: productsList[i].imageUrl,
                  // isFavorite: productsList[i].isFavorite,
                  // price: productsList[i].price,
                  // quantity: productsList[i].quantity,
                  // brand: productsList[i].brand,
                  
                ),
              );
            }),
      ),
    );
  }
}


// StaggeredGridView.countBuilder(
//               itemCount: 30,
//             crossAxisCount: 4,
          
//             itemBuilder: (BuildContext context, int i) => FeedsProducts(),
//             staggeredTileBuilder: (int index) =>
//                 StaggeredTile.count(2, index.isEven ? 3 : 4),
//             mainAxisSpacing: 10.0,
//             crossAxisSpacing: 10.0,
//           )
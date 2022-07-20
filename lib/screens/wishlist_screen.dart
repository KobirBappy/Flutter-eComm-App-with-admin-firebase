
import 'package:flutter/material.dart';
import 'package:flutter_shop_cpt21/Widgets/empty_wishlist.dart';
import 'package:flutter_shop_cpt21/Widgets/full_wishlist.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/wishlist-screeen';
  const WishListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _products = [];
    return !_products.isEmpty
        ? Scaffold(body: EmptyWishlist())
        : Scaffold(
            appBar: AppBar(
              title: Text('WishList'),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.delete)
              )
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 50),

              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, i){
                  
                  return FullWishlist(); 
                },
              ),
            ),
           
          );
  }
}
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_cpt21/models%20&%20providers/product.dart';
import 'package:flutter_shop_cpt21/screens/Inner_screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class FeedsProducts extends StatefulWidget {
  
  @override
  State<FeedsProducts> createState() => _FeedsProductsState();
}

class _FeedsProductsState extends State<FeedsProducts> {
  @override
  Widget build(BuildContext context) {

    final productAttribute = Provider.of<Product>(context);
    
        return InkWell(
      onTap: (){
         Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,arguments: productAttribute.id);

      },
      child: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.indigo),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.22,
                          minHeight: 170),
                      child: Image.network(
                          productAttribute.imageUrl),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(productAttribute.description,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16,),),
                    SizedBox(height: 4,),
                    Text('\$ ${productAttribute.price}',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16,),),
                    SizedBox(height: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Quantity:${productAttribute.quantity} ',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16,),),
                        InkWell(
                          onTap: (){},child: Icon(Icons.more_horiz),
                        )
                      ],
                    ),
                    SizedBox(height: 4,)
                  ]),
            ),
          ),
    
          Badge(
            animationType: BadgeAnimationType.slide,
        toAnimate: false,
        shape: BadgeShape.square,
        badgeColor: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(8),
        badgeContent: Text('New', style: TextStyle(color: Colors.white)),
      ),
        ],
      ),
    );
  }
}

import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_cpt21/models%20&%20providers/product.dart';
import 'package:flutter_shop_cpt21/screens/Inner_screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productAttribute = Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        width: 250,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: 250,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,arguments: productAttribute.id);
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          productAttribute.imageUrl,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Positioned(
                    top: 12,
                    right: 12,
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.favorite))),
                        Positioned(
                    bottom: 12,
                    right: 12,
                    child:Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('\$ ${productAttribute.price}',style: TextStyle(fontSize: 16),),
                      ),
                    ),
                        )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '${productAttribute.title}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '${productAttribute.description}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  InkWell(onTap: () {}, child: Icon(Icons.shopping_cart))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

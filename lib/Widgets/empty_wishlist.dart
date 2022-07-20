
import 'package:flutter/material.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/empty-wishlist.png',
                    ),
                    fit: BoxFit.contain)),
          ),
          Text(
            'Your WishList is empty',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'You Didn\'t \n Add anything Yet',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).unselectedWidgetColor),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: Text('Shop Now',style: TextStyle(fontSize: 20,color: Colors.white),)),
          )
        ],
      ),
    );
  }
}
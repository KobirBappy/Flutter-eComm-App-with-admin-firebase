import 'package:flutter/material.dart';
import 'package:flutter_shop_cpt21/Widgets/feeds_product.dart';
import 'package:flutter_shop_cpt21/screens/cart_screen.dart';
import 'package:flutter_shop_cpt21/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';

import '../../models & providers/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product-details-screen';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  GlobalKey previewContainer = GlobalKey();

  @override
  Widget build(BuildContext context) {

    final productId = ModalRoute.of(context)!.settings.arguments as String;

    Provider.of<ProductProvider>(context, listen: false);

    // final ProductProvider = Provider.of<ProductProvider>(context,listen: false);

//     final productData = Provider.of<ProductProvider>(context);
// final productBrand = productData.getByBrandName(brand);

    List<Product> productsList = ProductProvider().products();

    final product = ProductProvider().getById(productId);


    return Scaffold(
      bottomSheet: _bottomSheet(),
      appBar: AppBar(
        title: Text('Details'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(WishListScreen.routeName);
            },
            icon: Icon(Icons.favorite),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Stack(children: [
        Container(
          foregroundDecoration: BoxDecoration(color: Colors.black12),
          height: MediaQuery.of(context).size.height * .45,
          width: double.infinity,
          child: Image.network(
              product.imageUrl),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.save)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.share))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * .9,
                              child: Text(
                                product.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 28),
                              )),
                          Text(
                            '\$ ${product.price}',
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.purple,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Divider(
                        thickness: 1,
                        color: Colors.amber,
                        height: 1,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                     ' ${product.description}',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Divider(
                        thickness: 1,
                        color: Colors.amber,
                        height: 1,
                      ),
                    ),
                    _contentRow(nameTitle: "${product.brand}", title: "Brand:"),
                    _contentRow(nameTitle: "${product.quantity}", title: "Quantity:"),
                    _contentRow(nameTitle: "${product.productCategoryName}", title: "Category:"),
                    _contentRow(nameTitle: product.isPopular ? 'Popular' : 'Barely', title: "Popularity:"),
                    Divider(
                      thickness: 1,
                      color: Colors.amber,
                      height: 1,
                    ),
                    Container(
                      color: Colors.black12,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'No views yet',
                              style: TextStyle(fontSize: 21),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Be the 1st review!',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                            height: 1,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                child: Text(
                  'Suggest Product',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (ctx, i) {
                      return Padding(
                          padding: EdgeInsets.all(8),
                          child: SizedBox(
                            width: 200,
                            child: ChangeNotifierProvider.value(
                              value: productsList[i],
                              child: FeedsProducts(),
                            ),
                          ));
                    }),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class _contentRow extends StatelessWidget {
  final String title;
  final String nameTitle;
  const _contentRow({
    required this.title,
    required this.nameTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        children: [
          Text(
            '${title}',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),
          Text(
            nameTitle,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}

class _bottomSheet extends StatelessWidget {
  const _bottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Container(
              color: Colors.amberAccent,
              height: 50,
              child: Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Add to cart',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              ),
            )),
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              height: 50,
              child: Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Buy Now',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    )),
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey.withOpacity(.2),
              height: 50,
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                ),
              ),
            ))
      ],
    );
  }
}

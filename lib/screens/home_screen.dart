import 'package:backdrop/backdrop.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_cpt21/Widgets/back_layer.dart';
import 'package:flutter_shop_cpt21/Widgets/category.dart';
import 'package:flutter_shop_cpt21/Widgets/popular_products.dart';
import 'package:flutter_shop_cpt21/screens/Inner_screens/brands_nav_rail.dart';
import 'package:flutter_shop_cpt21/screens/feeds_screen.dart';
import 'package:flutter_shop_cpt21/screens/wishlist_screen.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:provider/provider.dart';

import '../models & providers/product.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/Home-screen';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _carouselImages = [
    Image.asset('assets/images/carousel1.png'),
    Image.asset('assets/images/carousel2.jpeg'),
    Image.asset('assets/images/carousel3.jpeg'),
    Image.asset('assets/images/carousel4.png'),
  ];

  final List _swiperImages = [
    'assets/images/nike.jpeg',
    'assets/images/apple.jpeg',
    'assets/images/Dell.jpeg',
    'assets/images/h&m.jpeg',
    'assets/images/Huawei.jpeg',
    'assets/images/samsung.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
final productData = Provider.of<ProductProvider>(context);
final PopularProduct = productData.PopularProducts;


    return Scaffold(
      body: BackdropScaffold(
          headerHeight: MediaQuery.of(context).size.height * 0.4,
          appBar: BackdropAppBar(
            title: const Text("Flutter Shop"),
            leading: BackdropToggleButton(
              icon: AnimatedIcons.home_menu,
            ),
            actions: [
              IconButton(onPressed: (){
                Navigator.of(context).pushNamed(WishListScreen.routeName);
              }, icon: Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-vector/sticker-template-with-smile-face-emoji-isolated_1308-59866.jpg?w=2000'),
                    ),
                  ))
            ],
          ),
          backLayer: BackLayer(),
          frontLayer: ListView(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Carousel(
                  images: _carouselImages,
                  autoplay: true,
                  animationDuration: Duration(seconds: 5),
                  animationCurve: Curves.fastOutSlowIn,
                  indicatorBgPadding: 7,
                  dotSize: 5,
                  boxFit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Categorys',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) {
                      return Row(
                        children: [
                          Category(
                            i: i,
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      );
                    },
                    itemCount: 7),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Brands',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    TextButton(onPressed: () {
                       Navigator.of(context).pushNamed(BrandsNavrailScreen.routName,arguments: 7);
                    }, child: Text('viewAll'))
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Swiper(
                  onTap: (index){
                    Navigator.of(context).pushNamed(BrandsNavrailScreen.routName,arguments: index);
                  },
                    itemCount: _swiperImages.length,
                    autoplay: true,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    itemBuilder: (ctx, i) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          _swiperImages[i],
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Products',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    TextButton(onPressed: () {
                      Navigator.of(context).pushNamed(FeedScreen.routeName,arguments: 'popular');
                    }, child: Text('viewAll'))
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: (ctx, i) {
                    return ChangeNotifierProvider.value(value: PopularProduct[i],child: PopularProducts(),);
                  },
                ),
              ),
            ],
          )),
    );
  }
}

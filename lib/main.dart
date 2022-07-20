import 'package:flutter/material.dart';
import 'package:flutter_shop_cpt21/models%20&%20providers/my_theme.dart';
import 'package:flutter_shop_cpt21/models%20&%20providers/product.dart';
import 'package:flutter_shop_cpt21/screens/Inner_screens/brands_nav_rail.dart';
import 'package:flutter_shop_cpt21/screens/Inner_screens/categories_feed_screen.dart';
import 'package:flutter_shop_cpt21/screens/Inner_screens/product_details_screen.dart';
import 'package:flutter_shop_cpt21/screens/bottom_nav_screeen.dart';
import 'package:flutter_shop_cpt21/screens/cart_screen.dart';
import 'package:flutter_shop_cpt21/screens/feeds_screen.dart';
import 'package:flutter_shop_cpt21/screens/home_screen.dart';
import 'package:flutter_shop_cpt21/screens/search_screen.dart';
import 'package:flutter_shop_cpt21/screens/user_screen.dart';
import 'package:flutter_shop_cpt21/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeNotifier()),  
          ChangeNotifierProvider(
          create: (context) => ProductProvider())
      ],
      child: Consumer<ThemeNotifier>(builder: (context, notifier, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyAppTheme.myThemes(notifier.isDark, context),
          home: BottomNavScreen(),
          routes: {
            BottomNavScreen.routeName: (ctx) => BottomNavScreen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
            FeedScreen.routeName: (ctx) => FeedScreen(),
            SearchScreen.routeName: (ctx) => SearchScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            UserScreen.routeName: (ctx) => UserScreen(),
            BrandsNavrailScreen.routName: (ctx) => BrandsNavrailScreen(),
            WishListScreen.routeName: (ctx) => WishListScreen(),
            ProductDetailsScreen.routeName: (ctx)=> ProductDetailsScreen(),
            CategoriesFeedScreen.routeName: (ctx)=> CategoriesFeedScreen()
          },
        );
      }),
    );
  }
}

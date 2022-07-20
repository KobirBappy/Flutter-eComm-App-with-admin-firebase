import 'package:flutter/material.dart';
import 'package:flutter_shop_cpt21/screens/cart_screen.dart';
import 'package:flutter_shop_cpt21/screens/feeds_screen.dart';
import 'package:flutter_shop_cpt21/screens/home_screen.dart';
import 'package:flutter_shop_cpt21/screens/search_screen.dart';
import 'package:flutter_shop_cpt21/screens/user_screen.dart';

class BottomNavScreen extends StatefulWidget {
  static const routeName = '/Bottom-nav-screen';
  const BottomNavScreen({ Key? key }) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  List _pages =[
    HomeScreen(),
    FeedScreen(),
    SearchScreen(),
    CartScreen(),
    UserScreen(),
  ];
  int _currentIndex= 0;
  _onTap(int i){

    setState(() {
      _currentIndex =i;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',tooltip: 'Home'),
           BottomNavigationBarItem(icon: Icon(Icons.rss_feed),label: 'Feed',tooltip: 'Feed'),
            BottomNavigationBarItem(icon: Icon(null),label: '',tooltip: ''),
             BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: 'Cart',tooltip: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: 'User',tooltip: 'User'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.search),
      tooltip: 'Search',
      onPressed: (){
        _onTap(2);
      },),
    );
  }
}
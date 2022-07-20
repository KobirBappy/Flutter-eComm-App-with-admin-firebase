import 'package:flutter/material.dart';
import 'package:flutter_shop_cpt21/screens/Inner_screens/categories_feed_screen.dart';

class Category extends StatefulWidget {

  late int i;

  Category({required this.i, Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Map<String, Object>> _categories = [
    {'catName': 'Phones', 'catImage': 'assets/images/CatPhones.png'},
    {'catName': 'Laptops', 'catImage': 'assets/images/CatLaptops.png'},
    {'catName': 'Shoes', 'catImage': 'assets/images/CatShoes.jpeg'},
    {'catName': 'Watchs', 'catImage': 'assets/images/CatWatches.jpeg'},
    {'catName': 'Furniture', 'catImage': 'assets/images/CatFurniture.jpeg'},
    {'catName': 'Beauty', 'catImage': 'assets/images/CatBeauty.jpeg'},
    {'catName': 'Clothes', 'catImage': 'assets/images/CatClothes.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CategoriesFeedScreen.routeName,
        arguments: _categories[widget.i]['catName'],);

        
       // print('${_categories[widget.i]['catName']}');
      },
      child: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              child: ClipRRect( borderRadius: BorderRadius.circular(12),child: Image.asset((_categories[widget.i]['catImage']).toString(),fit: BoxFit.cover,)),
              
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              (_categories[widget.i]['catName']).toString(),
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

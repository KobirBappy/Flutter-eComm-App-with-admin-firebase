import 'package:flutter/material.dart';
import 'package:flutter_shop_cpt21/models%20&%20providers/product.dart';
import 'package:flutter_shop_cpt21/screens/Inner_screens/brands_nav_rail_widget.dart';
import 'package:provider/provider.dart';

class BrandsNavrailScreen extends StatefulWidget {
  static const routName = '/brands-nav-rail';
  const BrandsNavrailScreen({Key? key}) : super(key: key);

  @override
  State<BrandsNavrailScreen> createState() => _BrandsNavrailScreenState();
}

class _BrandsNavrailScreenState extends State<BrandsNavrailScreen> {
  late String routeArgs;
  late String brands;
  int _selecetedIndex = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    routeArgs = ModalRoute.of(context)!.settings.arguments.toString();
    _selecetedIndex = int.parse(routeArgs.substring(0, 1));

    if (_selecetedIndex == 0) {
      setState(() {
        brands = 'Addidas';
      });
    }
    if (_selecetedIndex == 1) {
      setState(() {
        brands = 'Apple';
      });
    }
    if (_selecetedIndex == 2) {
      setState(() {
        brands = 'Dell';
      });
    }
    if (_selecetedIndex == 3) {
      setState(() {
        brands = 'Nike';
      });
    }
    if (_selecetedIndex == 4) {
      setState(() {
        brands = 'Samsung';
      });
    }
    if (_selecetedIndex == 5) {
      setState(() {
        brands = 'H&M';
      });
    }
    if (_selecetedIndex == 6) {
      setState(() {
        brands = 'Huwaei';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LayoutBuilder(builder: (ctx, cons) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: cons.maxHeight),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    selectedLabelTextStyle: TextStyle(
                        letterSpacing: 2.5,
                        fontSize: 25,
                        decoration: TextDecoration.underline),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-vector/sticker-template-with-smile-face-emoji-isolated_1308-59866.jpg?w=2000'),
                      ),
                    ),
                    labelType: NavigationRailLabelType.all,
                    destinations: [
                      _navRailRotatedBox('Addidas'),
                      _navRailRotatedBox('Apple'),
                      _navRailRotatedBox('Dell'),
                      _navRailRotatedBox('H&M'),
                      _navRailRotatedBox('Huawei'),
                      _navRailRotatedBox('Nike'),
                      _navRailRotatedBox('Samsung'),
                      _navRailRotatedBox('All'),
                    ],
                    selectedIndex: _selecetedIndex,
                    onDestinationSelected: (index) {
                      setState(() {
                        _selecetedIndex = index;

                        if (_selecetedIndex == 0) {
                          setState(() {
                            brands = 'Addidas';
                          });
                        }
                        if (_selecetedIndex == 1) {
                          setState(() {
                            brands = 'Apple';
                          });
                        }
                        if (_selecetedIndex == 2) {
                          setState(() {
                            brands = 'Dell';
                          });
                        }
                        if (_selecetedIndex == 3) {
                          setState(() {
                            brands = 'Nike';
                          });
                        }
                        if (_selecetedIndex == 4) {
                          setState(() {
                            brands = 'Samsung';
                          });
                        }
                        if (_selecetedIndex == 5) {
                          setState(() {
                            brands = 'H&M';
                          });
                        }
                        if (_selecetedIndex == 6) {
                          setState(() {
                            brands = 'Huwaei';
                          });
                        }
                        if (_selecetedIndex == 7) {
                          setState(() {
                            brands = 'All';
                          });
                        }
                      });
                    },
                  ),
                ),
              ),
            );
          }),
          ContentSpace(brand: brands,)
        ],
      ),
    );
  }

  NavigationRailDestination _navRailRotatedBox(String text) {
    return NavigationRailDestination(
        icon: Icon(null),
        label: RotatedBox(quarterTurns: 3, child: Text(text)));
  }
}

class ContentSpace extends StatelessWidget {
  final String brand;
  const ContentSpace({required this.brand, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

final productData = Provider.of<ProductProvider>(context);
final productBrand = productData.getByBrandName(brand);


if(brand == 'All'){
  for(int i=0; i<productData.products().length; i++){
    productBrand.add(productData.products()[i]);
  }
}

    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: ListView.builder(
                  itemCount: productBrand.length,
                  itemBuilder: (ctx, i) {
                    return ChangeNotifierProvider.value(value: productBrand[i],child: BrandRailWidget());
                  }),
            )),
      ),
    );
  }
}

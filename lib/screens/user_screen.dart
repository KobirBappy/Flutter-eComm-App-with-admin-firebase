import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_shop_cpt21/models%20&%20providers/my_theme.dart';
import 'package:flutter_shop_cpt21/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/User-screen';
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  double tp = 0;
  late ScrollController _scrollController;


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
      
    });
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
             slivers: [
            SliverAppBar(
              pinned: true,
              stretch: true,
              expandedHeight: 250,
              flexibleSpace: LayoutBuilder(builder: (ctx, cons){
                tp = cons.biggest.height;
                return FlexibleSpaceBar(
                background: Image.network(
                  'https://images.pexels.com/photos/3342003/pexels-photo-3342003.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  fit: BoxFit.cover,
                ),
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: tp <= 200 ? 1: 0,
                  child: Row(
                
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/1157936/pexels-photo-1157936.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Flutter Commerz',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              );
              })
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(primary: false, shrinkWrap: true, children: [
                  _userTileText(text: 'User Bag'),
                  _userTilehightSpace(
                    hight: 10,
                  ),
                  _userListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(WishListScreen.routeName);
                    },
                    lIcon: Icons.favorite,
                    color: Colors.red,
                    title: 'Wishlist',
                    tIcon: Icons.arrow_forward_ios,
                    tIconCallBack: () {},
                  ),
                  _userListTile(
                    lIcon: Icons.shopping_cart,
                    title: 'Cart',
                    color: Colors.pinkAccent,
                    tIcon: Icons.arrow_forward_ios,
                    tIconCallBack: () {},
                  ),
                  _userTilehightSpace(hight: 15),
                  _userTileText(text: 'User Setting'),
                  _userTilehightSpace(hight: 10),


                  Card(
                    child: Consumer<ThemeNotifier>(
                     
                      builder: (context, notifier, _) {
                        return SwitchListTile.adaptive(
                            secondary: notifier.isDark ?
                            Icon(Icons.dark_mode, color: Colors.blueGrey):
                                Icon(Icons.light_mode, color: Colors.blueGrey),
                            title:notifier.isDark? Text('Dark mode'):  Text('Light mode'),
                            value: notifier.isDark,
                            onChanged: (value) {
                              notifier.toggleTheme(value);
                            });
                      }
                    ),
                  ),



                  _userTilehightSpace(hight: 15),
                  _userTileText(text: 'User Info'),
                  _userTilehightSpace(hight: 10),
                  _userListTile(
                    lIcon: Icons.email,
                    title: 'Email',
                    color: Colors.green,
                    subTitle: 'Eamil',
                    onTap: () {},
                  ),
                  _userListTile(
                    lIcon: Icons.call,
                    color: Colors.black,
                    title: 'Phone Number',
                    subTitle: 'Eamil',
                    onTap: () {},
                  ),
                  _userListTile(
                    lIcon: Icons.local_shipping,
                    title: 'Address',
                    color: Colors.blue,
                    subTitle: 'Eamil',
                    onTap: () {},
                  ),
                  _userListTile(
                    lIcon: Icons.watch_later,
                    title: 'Join Date',
                    color: Colors.pinkAccent,
                    subTitle: 'Date',
                  ),
                ]),
              ),
            )
          ]),
          _buildFab()
        ],
      ),
    );
  }

  Widget _buildFab(){
double defaultMargin = Platform.isIOS ? 270 : 250;
double scrollStart = 230;
double scrollEnd = scrollStart/2;
double top = defaultMargin;
double scale = 1;


if (_scrollController.hasClients) {
  double offSet = _scrollController.offset;
  if (offSet < defaultMargin - scrollStart) {
    scale =1;
    top -= offSet;
  }else if (offSet < defaultMargin- scrollEnd) {
    scale = (defaultMargin - scrollEnd - offSet)/ scrollEnd;
  }else {
    scale = 0;
  }
}

return  Positioned(
        top: top,
        right: 20,
        child: Transform(
          transform: Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.camera),
          ),
        )
        
        );
}
}



// class _buildFab extends StatelessWidget {
//   const _buildFab({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//         top: Platform.isIOS ? 270: 250,
//         right: 20,
//         child: FloatingActionButton(
//           onPressed: () {},
//           child: Icon(Icons.camera),
//         )
        
//         );
//   }
// }

class _userListTile extends StatelessWidget {
  final IconData lIcon;
  final Color color;
  final String title;
  final String? subTitle;
  final IconData? tIcon;
  final VoidCallback? tIconCallBack;
  final VoidCallback? onTap;

  const _userListTile({
    this.subTitle,
    this.tIcon,
    this.tIconCallBack,
    this.onTap,
    Key? key,
    required this.lIcon,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(lIcon),
        iconColor: color,
        title: Text(title),
        subtitle: subTitle == null ? null : Text(subTitle!),
        trailing: IconButton(onPressed: tIconCallBack, icon: Icon(tIcon)),
      ),
    );
  }
}

class _userTilehightSpace extends StatelessWidget {
  final double hight;
  const _userTilehightSpace({Key? key, required this.hight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
    );
  }
}

class _userTileText extends StatelessWidget {
  final String text;
  _userTileText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "  $text",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

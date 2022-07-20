import 'package:flutter/material.dart';

class BackLayer extends StatelessWidget {
  const BackLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _rotetedBox(
          top: -100,
          left: -28,
        ),

        _rotetedBox(
          top: -100,
          left: 200,
        ),
        SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.network(
                        'https://img.freepik.com/free-vector/sticker-template-with-smile-face-emoji-isolated_1308-59866.jpg?w=2000'),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                // _backLayerButton(
                //     onPressed: () {}, title: 'Home Screen', icon: Icons.home),
                // _backLayerButton(
                //     onPressed: () {},
                //     title: 'Feed Screen',
                //     icon: Icons.rss_feed),
                // _backLayerButton(
                //     onPressed: () {},
                //     title: 'Search Screen',
                //     icon: Icons.search),
                // _backLayerButton(
                //     onPressed: () {},
                //     title: 'Cart Screen',
                //     icon: Icons.shopping_bag),
                // _backLayerButton(
                //     onPressed: () {}, title: 'User Screen', icon: Icons.person),
                _backLayerButton(
                    onPressed: () {},
                    title: 'upload Screen',
                    icon: Icons.upload),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _rotetedBox extends StatelessWidget {
  final double top;
  final double left;

  const _rotetedBox({
    Key? key, required this.top, required this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        child: Transform.rotate(angle: -0.5,
          child: Container(
            width: 200,
            height : 300,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(12)),
          ),
        ));
  }
}

class _backLayerButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  const _backLayerButton(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(title),
    );
  }
}

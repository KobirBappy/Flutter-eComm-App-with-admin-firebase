import 'package:flutter/material.dart';

class FullWishlist extends StatefulWidget {
  const FullWishlist({Key? key}) : super(key: key);

  @override
  State<FullWishlist> createState() => _FullWishlistState();
}

class _FullWishlistState extends State<FullWishlist> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 170,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2014/12/08/14/23/pocket-watch-560937_960_720.jpg'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(
                      "Monitor 2",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      'price :',
                      style: TextStyle(fontSize: 15),
                    ),
                    Flexible(
                      child: Text(
                        '\$ 400',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                    child: Text(
                  "Description",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18),
                )),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

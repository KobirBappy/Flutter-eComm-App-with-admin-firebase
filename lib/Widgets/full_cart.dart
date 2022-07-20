import 'dart:ui';

import 'package:flutter/material.dart';

class FullCart extends StatefulWidget {
  const FullCart({Key? key}) : super(key: key);

  @override
  State<FullCart> createState() => _FullCartState();
}

class _FullCartState extends State<FullCart> {
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
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
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
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Row(
                    children: [
                      Text(
                        'Sub Total :',
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
                  Row(
                    children: [
                      Text(
                        'Shipping :',
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

                  Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                    TextButton(onPressed: (){}, child: Text('-',style: TextStyle(fontSize: 25),)),
                    Text('1',style:TextStyle(fontSize: 20),),
                     TextButton(onPressed: (){}, child: Text('+',style: TextStyle(fontSize: 25),)),
                  ],)
                ],
              )
              )
            ],
          ),
        ),
      );
  }
}

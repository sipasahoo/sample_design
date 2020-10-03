import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdesigns/multipage.dart';
import 'constants.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  final String description;
  DetailPage({Key key, this.image, this.name, this.price, this.description})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<dynamic> responseList = FOOD_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          DetailPageall(
              image: widget.image,
              name: widget.name,
              price: widget.price,
              description: widget.description),
          DetailPageall(
              image: responseList[0]["image"],
              name: responseList[0]["name"],
              price: responseList[0]["price"],
              description: responseList[0]["description"]),
          DetailPageall(
              image: responseList[1]["image"],
              name: responseList[1]["name"],
              price: responseList[1]["price"],
              description: responseList[1]["description"]),
          DetailPageall(
              image: responseList[2]["image"],
              name: responseList[2]["name"],
              price: responseList[2]["price"],
              description: responseList[2]["description"]),
          DetailPageall(
              image: responseList[3]["image"],
              name: responseList[3]["name"],
              price: responseList[3]["price"],
              description: responseList[3]["description"]),
          DetailPageall(
              image: responseList[4]["image"],
              name: responseList[4]["name"],
              price: responseList[4]["price"],
              description: responseList[4]["description"]),
          DetailPageall(
              image: responseList[5]["image"],
              name: responseList[5]["name"],
              price: responseList[5]["price"],
              description: responseList[5]["description"]),
          DetailPageall(
              image: responseList[6]["image"],
              name: responseList[6]["name"],
              price: responseList[6]["price"],
              description: responseList[6]["description"]),
          DetailPageall(
              image: responseList[7]["image"],
              name: responseList[7]["name"],
              price: responseList[7]["price"],
              description: responseList[7]["description"]),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class DetailPageall extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  final String description;
  DetailPageall({Key key, this.image, this.name, this.price, this.description})
      : super(key: key);

  @override
  _DetailPageallState createState() => _DetailPageallState();
}

class _DetailPageallState extends State<DetailPageall> {
  List<dynamic> responseList = FOOD_DATA;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    Widget _detailpage() {
      return SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 260),
                      child: Container(
                        height: height,
                        width: width,
                        //margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.cover),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withAlpha(100),
                                  blurRadius: 10.0),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 48.0),
                          child: Stack(
                            children: [
                              ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.description,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  )),
                            ],
                          ),
                        ),
                      )),
                  Container(
                      alignment: Alignment.topCenter,
                      height: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        color: Colors.grey[100],
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            trailing: Icon(Icons.forward),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset("images/pizza_logo.png",
                                height: 30),
                          ),
                          Text(widget.name, style: TextStyle(fontSize: 22)),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 30),
                            child: Text(widget.price.toString(),
                                style: TextStyle(
                                    fontSize: 40, color: Colors.purple)),
                          ),
                          ListTile(
                            title: Center(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Text("Information"),
                            )),
                            trailing: Icon(Icons.info),
                          ),
                        ],
                      )),
                ],
              ),
            ]),
          ),
        ),
      );
    }

    return Scaffold(
      body: _detailpage(),
    );
  }
}

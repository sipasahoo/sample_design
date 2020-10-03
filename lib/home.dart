import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdesigns/detailpage.dart';
import 'constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  List<Widget> itemsData = [];
  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailPage(
                  image: post["image"],
                  name: post["name"],
                  price: post["price"],
                  description: post["description"])));
        },
        child: Container(
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("${post["image"]}"), fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Stack(
            children: [
              ListTile(
                  title: Text(post["name"],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  subtitle: Text(" ${post["price"]}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18))),
            ],
          ),
        ),
      ));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  Widget _horizontalview() {
    return Container(
        height: MediaQuery.of(context).size.height / 4,
        child: ListView.builder(
            itemCount: 12,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            child: Image.asset("images/pizza.jpg",
                                height: MediaQuery.of(context).size.height /6),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pizza Hot"),
                              Text("123"),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset("images/pizza_logo.png",
                              height: MediaQuery.of(context).size.height / 18),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double categoryHeight = height * 0.30;
    //print(height);print(width);
    Widget _cardview() {
      return Positioned(
          top: 80,
          bottom: 0,
          left: 20,
          right: 20,
          child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Wrap(
                children: [
                  ListTile(
                    leading: Container(
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Load",
                            style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                        ),
                      ),
                    ),
                    trailing: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "1500",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(right: 13.0),
                            child: Text(
                              'points',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.red,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('images/person.jpg'),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "ABDULLAH SALAH",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("+918578934579"),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 35,
                        left: 220,
                        right: 0,
                        child: Container(
                          height: 45,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                          ),
                          child: Center(
                            child: Text(
                              'Check Rewards',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )));
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          child: Column(
            children: <Widget>[
              Container(
                height: height / 2.5,
                child: Stack(
                  children: <Widget>[
                    ClipPath(
                      child: Container(height: height / 3, color: Colors.red),
                      clipper: BottomWaveClipper(),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 50,
                      left: 20,
                      right: 20,
                      child: ListTile(
                        leading: Icon(Icons.menu, color: Colors.white),
                        trailing: Icon(Icons.search, color: Colors.white),
                      ),
                    ),
                    _cardview(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  "Trending",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                trailing: Text(
                  "View All",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
                    child: _horizontalview()),
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform: Matrix4.identity()..scale(scale, scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

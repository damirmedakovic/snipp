import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
  'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
  'https://images.unsplash.com/photo-1519345182560-3f2917c472ef?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80'
];

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<Widget> imageSliders = imgList
      .map((item) => Column(children: <Widget>[
            Expanded(
              child: Container(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.network(item, fit: BoxFit.cover, width: 1000.0),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Text(
                                'NOK. ${imgList.indexOf(item)}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            Text(
              "Helloo",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ]))
      .toList();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
                child: Text(
                  'Nye',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 5),
                  child: TextButton(
                    child: Text(
                      'Vis alle',
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  )),
            ],
          ),
          Container(
              child: CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 2,
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                initialPage: 1,
                viewportFraction: 0.5,
                scrollPhysics: ScrollPhysics()),
            items: imageSliders,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
                child: Text(
                  'Musikere',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 5),
                  child: TextButton(
                    child: Text(
                      'Vis alle',
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  )),
            ],
          ),
          Container(
              child: CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 2,
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                initialPage: 1,
                viewportFraction: 0.5,
                scrollPhysics: ScrollPhysics()),
            items: imageSliders,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
                child: Text(
                  'Influencere',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 5),
                  child: TextButton(
                    child: Text(
                      'Vis alle',
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  )),
            ],
          ),
          Container(
              child: CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 2,
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                initialPage: 1,
                viewportFraction: 0.5,
                scrollPhysics: ScrollPhysics()),
            items: imageSliders,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
                child: Text(
                  'TV-personligheter',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 5),
                  child: TextButton(
                    child: Text(
                      'Vis alle',
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  )),
            ],
          ),
          Container(
              child: CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 2,
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                initialPage: 1,
                viewportFraction: 0.5,
                scrollPhysics: ScrollPhysics()),
            items: imageSliders,
          )),
        ]),
      ),
    );
  }
}

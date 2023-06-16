import 'dart:ui';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_drawer/flutter_3d_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DrawerControl drawerControl = DrawerControl();
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Flutter3dDrawer(
            controller: drawerControl,
            backgroundColor: const Color.fromRGBO(127, 157, 157, 1),
            maxSlide: MediaQuery.of(context).size.width * 0.7,
            body: DraggableHome(
              leading: IconButton(
                onPressed: () {
                  drawerControl.toggle();
                },
                icon: const Icon(Icons.menu_rounded),
              ),
              title: const Text("Uzbek Heritage"),
              actions: const [],
              headerWidget: headerWidget(context),
              headerBottomBar: headerBottomBarWidget(),
              body: [
                itemOfShahar(),
                itemOfShahar(),
                itemOfShahar(),
                itemOfShahar(),
                itemOfShahar(),
                itemOfShahar(),
                itemOfShahar(),
              ],
              backgroundColor: Colors.white,
              appBarColor: const Color.fromRGBO(63, 201, 200, 1.0),
            ),
            drawer: Container(
              color: const Color.fromRGBO(10, 12, 14, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      const SizedBox(
                        child: Image(image: AssetImage("assets/images/img_4.png"),fit: BoxFit.cover),
                      ),
                      BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Container(
                            color: Colors.black.withOpacity(0),
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 1, bottom: 20, right: 20, left: 20),
                height: size.width * .155,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.15),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: size.width * .024),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(
                        () {
                          currentIndex = index;
                        },
                      );
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 1500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          margin: EdgeInsets.only(
                            bottom:
                                index == currentIndex ? 0 : size.width * .029,
                            right: size.width * .0422,
                            left: size.width * .0422,
                          ),
                          width: size.width * .128,
                          height: index == currentIndex ? size.width * .014 : 0,
                          decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10),
                            ),
                          ),
                        ),
                        Icon(
                          listOfIcons[index],
                          size: size.width * .076,
                          color: index == currentIndex
                              ? Colors.blueAccent
                              : Colors.black38,
                        ),
                        SizedBox(height: size.width * .03),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Row headerBottomBarWidget() {
  TextEditingController textController = TextEditingController();
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      AnimSearchBar(
        width: 370,
        textController: textController,
        onSuffixTap: () {
          setState(() {
            textController.clear();
          });
        },
        onSubmitted: (String) {},
      )
    ],
  );
}

void setState(Null Function() param0) {}

Widget headerWidget(BuildContext context) {
  return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(110, 110, 255, 1),
          Color.fromRGBO(74, 173, 255, 1),
          Color.fromRGBO(74, 255, 250, 1),
        ],
      )),
      child: Column(
        children: [
          SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                  top: 100, left: 10, right: 10, bottom: 20),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  itemOfViloyat(),
                  itemOfViloyat(),
                  itemOfViloyat(),
                  itemOfViloyat(),
                  itemOfViloyat(),
                  itemOfViloyat(),
                  itemOfViloyat(),
                  itemOfViloyat(),
                  itemOfViloyat(),
                  itemOfViloyat(),
                  itemOfViloyat(),
                ],
              )),
        ],
      ));
}

ListView listView() {
  return ListView.builder(
    padding: const EdgeInsets.only(top: 0),
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 20,
    shrinkWrap: true,
    itemBuilder: (context, index) =>
        Card(color: Colors.white70, child: Container()),
  );
}

Widget itemOfViloyat() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    height: 130,
    width: 150,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.red,
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.transparent,
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(-4, -4),
          )
        ]),
  );
}

Widget itemOfShahar() {
  return Container(
    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    margin: const EdgeInsets.only(bottom: 20.0),
    height: 300,
    child: Row(
      children: <Widget>[
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(5.0, 5.0),
                    blurRadius: 10.0)
              ]),
        )),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5.0, 5.0),
                      blurRadius: 10.0)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Bekhruz",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text("khoshimov",
                    style: TextStyle(color: Colors.grey, fontSize: 18.0)),
                SizedBox(
                  height: 20.0,
                ),
                Text("hello",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30.0,
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Text("world",
                    style: TextStyle(
                        fontSize: 18.0, color: Colors.grey, height: 1.5))
              ],
            ),
          ),
        )
      ],
    ),
  );
}

List<IconData> listOfIcons = [
  Icons.home_rounded,
  Icons.favorite_rounded,
  Icons.settings_rounded,
  Icons.person_rounded,
];


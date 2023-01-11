import 'package:bh_assignment/constants.dart';
import 'package:bh_assignment/src/models/navigation_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottonNavScreen extends StatefulWidget {
  const BottonNavScreen({super.key});

  @override
  State<BottonNavScreen> createState() => _BottonNavScreenState();
}

class _BottonNavScreenState extends State<BottonNavScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigatorItems[page].screen,
      bottomNavigationBar: CurvedNavigationBar(
          height: 75,
          index: page,
          onTap: (index) {
            setState(() {
              page = index;
            });
          },
          key: _bottomNavigationKey,
          backgroundColor: Colors.white,
          color: Colors.white,
          // buttonBackgroundColor: Colors.blu,
          items: navigatorItems.map((e) {
            return getNavigationBarItem(
                label: e.label, index: e.index, iconPath: e.iconPath);
          }).toList()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Image.asset(
          'assets/icons/arrow.png',
          height: 20,
          width: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget getNavigationBarItem({String? label, String? iconPath, int? index}) {
    Color iconColor = index == page ? Colors.blue : Colors.black;
    return FittedBox(
      child: Column(
        children: [
          Image.asset(
            iconPath!,
            color: iconColor,
            height: 20,
            width: 20,
          ),
          Text(
            label!,
            style: TextStyle(color: iconColor),
          )
        ],
      ),
    );
  }
}

import 'package:bh_assignment/src/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Home", "assets/icons/homes.png", 0, const HomeScreen()),
  NavigatorItem(
      "Coins", "assets/icons/coins.png", 1, Center(child: Text('Coins'))),
  NavigatorItem(
      "Wallet", "assets/icons/wallets.png", 3, Center(child: Text('Wallet'))),
  NavigatorItem(
      "You", "assets/icons/customer.png", 4, Center(child: Text('Person'))),
];

import 'package:bh_assignment/src/screens/coin_screen.dart';
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
  NavigatorItem("Coins", "assets/icons/coins.png", 1, CoinScreen()),
  NavigatorItem("Wallet", "assets/icons/wallets.png", 2,
      const Center(child: Text('Wallet'))),
  NavigatorItem("You", "assets/icons/customer.png", 3,
      const Center(child: Text('Person'))),
];

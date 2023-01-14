import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> homeItemScreen = const [
  Text('Home'),
  Text('coins'),
  Text('exchange'),
  Text('wallet'),
  Text('person'),
];

Color checkCoin(String price) {
  if (price.startsWith('0')) {
    return Colors.red;
  } else if (price.startsWith('-')) {
    return Colors.red;
  }

  return Colors.green;
}

Widget elevetedButton(index) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade900),
    onPressed: () {},
    child: Text(
      'Buy',
      style: GoogleFonts.raleway(fontSize: 12),
    ),
  );
}

Widget buyCoin(int index) {
  if (index == 0 || index == 1 || index == 2 || index == 3 || index == 9) {
    return elevetedButton(index);
  }
  return const SizedBox.shrink();
}

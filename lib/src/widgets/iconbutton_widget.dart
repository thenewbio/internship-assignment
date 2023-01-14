import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconButtons extends StatelessWidget {
  final String text;
  // final Function? onPressed;
  final IconData icon;
  bool isIcon;
  IconButtons(
      {super.key, required this.text, required this.icon, this.isIcon = true});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          isIcon
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    icon,
                    color: Colors.blue.shade900,
                    size: 40,
                  ),
                )
              : TextButton(
                  onPressed: () {},
                  child: Text(
                    '–',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.blue.shade900),
                  )),
          Text(
            text,
            style: GoogleFonts.lato(fontSize: 18, color: Colors.blue.shade900),
          )
        ],
      ),
    );
  }
}

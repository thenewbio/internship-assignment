import 'package:bh_assignment/src/screens/bottom_avigation_screen.dart';
import 'package:bh_assignment/src/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'src/screens/web_socket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WebSocket()
    );
  }
}

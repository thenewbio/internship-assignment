import 'package:bh_assignment/constants.dart';
import 'package:bh_assignment/src/models/navigation_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Column(
                  children: [
                    const Text('Welcome to AMPIY', style: TextStyle()),
                    const Text('Buy your first Crypto Asset today',
                        style: TextStyle()),
                    Container(
                      width: 300,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('Verify Account')),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.blue.shade900,
                            size: 40,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.minimize_rounded,
                            color: Colors.blue.shade900,
                            size: 40,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person,
                            color: Colors.blue.shade900,
                            size: 40,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.video_collection_outlined,
                            color: Colors.blue.shade900,
                            size: 40,
                          ))
                    ]),
              ),
              SizedBox(
                height: 150,
                width: double.maxFinite,
                child: Card(
                  color: Colors.white30,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Create wealth with SIP'),
                            Text(
                                'Invest, Grow, Repeat. Grow your money \n with SIP now'),
                            Container(
                              width: 150,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue.shade900),
                              child: ListTile(
                                title: Text(
                                  'Start a SIP',
                                  style: TextStyle(color: Colors.blue.shade900),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Image.asset('assets/icons/bloom.png'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

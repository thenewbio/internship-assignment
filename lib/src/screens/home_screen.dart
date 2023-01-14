import 'package:bh_assignment/src/screens/coin_screen.dart';
import 'package:bh_assignment/src/widgets/coins_widget.dart';
import 'package:bh_assignment/src/widgets/iconbutton_widget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.148,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Welcome to AMYPIY',
                          style: GoogleFonts.lato(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 3,
                      ),
                      Text('Buy your first Crypto Asset today',
                          style: GoogleFonts.lato(fontSize: 15)),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade900),
                            onPressed: () {},
                            child: Text(
                              'Verify Account',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w800),
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtons(text: 'Buy', icon: Icons.add_circle),
                        IconButtons(
                          text: 'Sell',
                          icon: Icons.add_circle,
                          isIcon: false,
                        ),
                        IconButtons(
                          text: 'Referral',
                          icon: Icons.person,
                        ),
                        IconButtons(
                            text: 'Tutorial',
                            icon: Icons.video_collection_outlined),
                      ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.19,
                  width: double.maxFinite,
                  child: Card(
                    color: Colors.white38,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Create wealth with SIP',
                                  style: GoogleFonts.raleway(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.w900),
                                ),
                                FittedBox(
                                  child: Text(
                                      'Invest, Grow, Repeat. Grow your money \n with SIP now',
                                      style: GoogleFonts.raleway(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(8),
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue.shade900),
                                    child: FittedBox(
                                        child: Row(
                                      children: [
                                        Text('Start a SIP',
                                            style: GoogleFonts.raleway(
                                                fontSize: 10,
                                                color: Colors.white)),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 8,
                                          color: Colors.white,
                                        )
                                      ],
                                    )))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          width: 125,
                          height: double.maxFinite,
                          child: Image.asset(
                            'assets/icons/bloom.png',
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: MediaQuery.of(context).size.height * 0.19,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.09),
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SIP Calculator',
                                  style: GoogleFonts.raleway(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text('Calculate Interests and \nReturns',
                                    style: GoogleFonts.raleway(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                              ],
                            )),
                            SizedBox(
                              height: 40,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.calculate_rounded,
                                      color: Colors.blue.shade900,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.black,
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.09),
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Deposit INR',
                                    style: GoogleFonts.raleway(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    'Use UPI or Bank Account \nto trade or buy SIP',
                                    style: GoogleFonts.raleway(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                              ],
                            )),
                            SizedBox(
                              height: 40,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.house_siding_rounded,
                                      color: Colors.blue.shade900,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.black,
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                CoinWidget()
              ],
            ),
          ),
        ));
  }
}

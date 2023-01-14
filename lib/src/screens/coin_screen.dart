import 'package:bh_assignment/src/screens/coin_price_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../provider/provider.dart';

class CoinScreen extends StatefulWidget {
  CoinScreen({super.key}) : provider = AmipyCoinProvider();
  late final AmipyCoinProvider provider;

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  @override
  void dispose() {
    widget.provider.closeCoin();
    super.dispose();
  }

  @override
  void reassemble() {
    widget.provider.closeCoin();
    super.reassemble();
  }

  @override
  void initState() {
    widget.provider.openCoin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.fromLTRB(8, 40, 8, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Coins',
                  style: GoogleFonts.lato(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 1)),
                    height: 50,
                    child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Search',
                            suffixIcon: Icon(Icons.search),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none))),
                Expanded(child: CoinValue(provider: widget.provider))
              ],
            )));
  }
}

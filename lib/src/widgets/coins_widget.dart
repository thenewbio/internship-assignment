import 'package:bh_assignment/src/models/coins_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bh_assignment/constants.dart';
import 'package:bh_assignment/src/models/amipy_coin_model.dart';
import '../provider/provider.dart';

class CoinWidget extends StatefulWidget {
  CoinWidget({super.key}) : provider = AmipyCoinProvider();
  late final AmipyCoinProvider provider;

  @override
  State<CoinWidget> createState() => _CoinWidgetState();
}

class _CoinWidgetState extends State<CoinWidget> {
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
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Coins',
              style:
                  GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 2000, child: CoinValue1(provider: widget.provider))
        ],
      ),
    );
  }
}

class CoinValue1 extends StatefulWidget {
  final AmipyCoinProvider provider;

  const CoinValue1({
    required this.provider,
    Key? key,
  }) : super(key: key);

  @override
  State<CoinValue1> createState() => _CoinValue1State();
}

class _CoinValue1State extends State<CoinValue1> {
  @override
  Widget build(BuildContext context) {
    return CoinPrice1(
      color: Colors.orange,
      stream: widget.provider.bitcoinStream,
    );
  }
}

class CoinPrice1 extends StatelessWidget {
  final Stream<AmipyModel> stream;
  final Color color;

  const CoinPrice1({
    required this.stream,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AmipyModel>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white38,
                  child: SizedBox(
                    height: 80,
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          backgroundImage: NetworkImage(coinList[index].image),
                        ),
                        title: Row(
                          children: [
                            Text(coinList[index].title,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(coinList[index].subTitle,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                        subtitle: FittedBox(
                          child: Row(
                            children: [
                              SizedBox(
                                child:
                                    Text('₹${snapshot.data!.data![index]!.c}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                        )),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: 70,
                                child: Row(
                                  children: [
                                    Text(
                                        snapshot.data!.data![index]!.p!
                                                    .startsWith('0') ||
                                                snapshot.data!.data![index]!.p!
                                                    .startsWith('1')
                                            ? "↓"
                                            : "↑",
                                        style: TextStyle(
                                          color: checkCoin(
                                              snapshot.data!.data![index]!.p!),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                        )),
                                    Text('${snapshot.data!.data![index]!.p}%',
                                        style: TextStyle(
                                          color: checkCoin(
                                              snapshot.data!.data![index]!.p!),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: buyCoin(index)),
                  ),
                );
              });
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return const Center(
            child: Text('No more data'),
          );
        }

        return const Center(
          child: Text('No data'),
        );
      },
    );
  }
}

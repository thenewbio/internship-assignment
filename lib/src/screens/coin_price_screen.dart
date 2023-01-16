import 'package:bh_assignment/constants.dart';
import 'package:bh_assignment/src/models/amipy_coin_model.dart';
import 'package:bh_assignment/src/models/coins_model.dart';
import 'package:flutter/material.dart';
import '../provider/provider.dart';

class CoinValue extends StatefulWidget {
  final AmipyCoinProvider provider;

  const CoinValue({
    required this.provider,
    Key? key,
  }) : super(key: key);

  @override
  State<CoinValue> createState() => _CoinValueState();
}

class _CoinValueState extends State<CoinValue> {
  @override
  Widget build(BuildContext context) {
    return CoinPrice(
      color: Colors.orange,
      stream: widget.provider.coinStream,
    );
  }
}

class CoinPrice extends StatelessWidget {
  final Stream<AmipyModel> stream;
  final Color color;

  const CoinPrice({
    required this.stream,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: StreamBuilder<AmipyModel>(
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
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                        height: 70,
                        width: double.maxFinite,
                        // elevation: 2,
                        color: snapshot.data!.data![index]!.p!.startsWith('0')
                            ? Colors.black.withOpacity(0.09)
                            : Colors.white38,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(coinList[index].image),
                          ),
                          title: Text(
                              '${snapshot.data!.data![index]!.s}'
                                  .substring(0, 3),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Text(coinList[index].title,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              )),
                          trailing: FittedBox(
                              child: Row(children: [
                            SizedBox(
                              child: Text('₹${snapshot.data!.data![index]!.c}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            FittedBox(
                                child: Container(
                                    padding: const EdgeInsets.all(8),
                                    width: 70,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: FittedBox(
                                      child: Row(
                                        children: [
                                          Text(
                                              snapshot.data!.data![index]!.p!
                                                          .startsWith('0') ||
                                                      snapshot.data!
                                                          .data![index]!.p!
                                                          .startsWith('-')
                                                  ? "↓"
                                                  : "↑",
                                              style: TextStyle(
                                                color: checkCoin(snapshot
                                                    .data!.data![index]!.p!),
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.normal,
                                              )),
                                          Text(
                                              '${snapshot.data!.data![index]!.p}%',
                                              style: TextStyle(
                                                color: checkCoin(snapshot
                                                    .data!.data![index]!.p!),
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.normal,
                                              )),
                                        ],
                                      ),
                                    )))
                          ])),
                        )),
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
      ),
    );
  }
}

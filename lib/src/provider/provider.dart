import 'dart:convert';

import 'package:bh_assignment/src/models/amipy_coin_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AmipyCoinProvider {
  late final WebSocketChannel _btcWebsocket;

  // static const _btcProduct = "BTCINR";

  AmipyCoinProvider()
      : _btcWebsocket = WebSocketChannel.connect(
          Uri.parse('wss://prereg.ex.api.ampiy.com/prices'),
        );

  Stream<AmipyModel> get bitcoinStream => _btcWebsocket.stream
      .map<AmipyModel>((value) => AmipyModel.fromJson(jsonDecode(value)));
  // .skipWhile((element) => element.productId != 1);

  void openCoin() {
    _btcWebsocket.sink.add(
      jsonEncode({
        "method": "SUBSCRIBE",
        "params": ["all@ticker"],
        "cid": 1
      }),
    );
  }

  void closeCoin() {
    _btcWebsocket.sink.close();
  }
}

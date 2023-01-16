import 'dart:convert';

import 'package:bh_assignment/src/models/amipy_coin_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AmipyCoinProvider {
  late final WebSocketChannel _coinWebsocket;

  AmipyCoinProvider()
      : _coinWebsocket = WebSocketChannel.connect(
          Uri.parse('wss://prereg.ex.api.ampiy.com/prices'),
        );

  Stream<AmipyModel> get coinStream => _coinWebsocket.stream
      .map<AmipyModel>((value) => AmipyModel.fromJson(jsonDecode(value)));

  void openCoin() {
    _coinWebsocket.sink.add(
      jsonEncode({
        "method": "SUBSCRIBE",
        "params": ["all@ticker"],
        "cid": 1
      }),
    );
  }

  void closeCoin() {
    _coinWebsocket.sink.close();
  }
}

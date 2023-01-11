import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket extends StatefulWidget {
  const WebSocket({super.key});

  @override
  State<WebSocket> createState() => _WebSocketState();
}

class _WebSocketState extends State<WebSocket> {
  final _channel = WebSocketChannel.connect(
    Uri.parse("wss://prereg.ex.api.ampiy.com/prices"),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _channel.stream,
        builder: (context, snapshot) {
          // print(snapshot.data);
          return Text(snapshot.hasData ? '${snapshot.data}' : '');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    _channel.sink.add(
      jsonEncode({
        "method": "SUBSCRIBE",
        "params": ["all@ticker"],
        "cid": 1
      }),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();

    super.dispose();
  }
}

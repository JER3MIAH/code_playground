import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  late IO.Socket socket;

  final List<String> _messages = [];

  void _sendMessage(String message) {
    if (_controller.text.isNotEmpty) {
      socket.emit('chat_message', message);
      _controller.clear();
    }
  }

  void _handleMessage(dynamic message) {
    setState(() {
      _messages.add(message);
    });
  }

  @override
  void initState() {
    _controller = TextEditingController();
    socket = IO.io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.on('chat_message', _handleMessage);
    super.initState();
  }

  @override
  void dispose() {
    socket.disconnect();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 40),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Your message',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                _sendMessageBox(
                  onTap: () {
                    _sendMessage(_controller.text);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: List.generate(
                _messages.length,
                (index) => ListTile(
                  title: Text(_messages[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sendMessageBox({VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 58,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: const Text(
          'Send',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Q7_Chat_Interface(),
      debugShowCheckedModeBanner: false,
    ));

class Q7_Chat_Interface extends StatefulWidget {
  @override
  _Q7_Chat_InterfaceState createState() => _Q7_Chat_InterfaceState();
}

class _Q7_Chat_InterfaceState extends State<Q7_Chat_Interface> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Interface')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(_messages[index])),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Enter message'),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        setState(() {
                          _messages.add(_controller.text);
                          _controller.clear();
                        });
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: Q3RestApi(),
    debugShowCheckedModeBanner: false,
  ));
}

class Q3RestApi extends StatefulWidget {
  const Q3RestApi({super.key});

  @override
  State<Q3RestApi> createState() => _Q3RestApiState();
}

class _Q3RestApiState extends State<Q3RestApi> {
  List items = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('REST API: List of Data')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                'Item ${index + 1}: ${items[index]['title']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Status: ${items[index]['completed']}'),
            ),
          );
        },
        itemCount: 30,
      ),
    );
  }

  Future<void> fetchItems() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      setState(() {
        items = json.decode(response.body);
      });
    }
  }
}

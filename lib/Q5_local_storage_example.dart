import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
      home: Q5_Local_Storage_Example(),
      debugShowCheckedModeBanner: false,
    ));

class Q5_Local_Storage_Example extends StatefulWidget {
  @override
  _Q5_Local_Storage_ExampleState createState() =>
      _Q5_Local_Storage_ExampleState();
}

class _Q5_Local_Storage_ExampleState extends State<Q5_Local_Storage_Example> {
  final TextEditingController _controller = TextEditingController();
  String _savedData = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_data', _controller.text);
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedData = prefs.getString('user_data') ?? 'No data saved';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SharedPreferences Example')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          children: [
            TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Enter some data')),
            ElevatedButton(onPressed: _saveData, child: Text('Save Data')),
            Text('Data in SharedPreferences: $_savedData'),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                child: Text(
                  'Go to second screen',
                  style: TextStyle(fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String _savedData = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedData = prefs.getString('user_data') ?? 'No data saved';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child:
            Text('Data in Second Screen from SharedPreferences: $_savedData'),
      ),
    );
  }
}

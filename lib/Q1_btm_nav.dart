import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BottomNav(),
    debugShowCheckedModeBanner: false,
  ));
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final screens = [
    Center(
      child: Text(
        'Home Screen',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Chat Screen',
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Call Screen',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Bottom Navigation: 3 screens'),
        centerTitle: true,
        elevation: 1,
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), label: 'Status'),
          BottomNavigationBarItem(
              icon: Icon(Icons.call), label: 'Call'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Rating(),
      debugShowCheckedModeBanner: false,
    ));

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int _rating = 0;

  _buildStar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _rating = index + 1;
        });
      },
      child: Icon(
        index < _rating ? Icons.star : Icons.star_border,
        color: Colors.blue,
        size: 40,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rating Bar Example')),
      body: Center(
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => _buildStar(index)),
            ),
            Text(
              'Rate me! 😊',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

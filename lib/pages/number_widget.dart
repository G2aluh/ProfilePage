
import 'package:flutter/material.dart';


class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              'Followers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('1.2K', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
        Column(
          children: [
            Text(
              'Following',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('300', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
        Column(
          children: [
            Text(
              'Posts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('45', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}
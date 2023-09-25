import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TextButton.icon(
                  icon: Icon(Icons.add_circle),
                  onPressed: () {},
                  label: Text("New Reminder"),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text("Add List"),
            ),
          ],
        ),
      );
  }
}

import 'package:flutter/material.dart';

import '../utils.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.arrow_back_ios_outlined, size: 30),
      backgroundColor: Colors.grey.shade100,
      foregroundColor: firstColor,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

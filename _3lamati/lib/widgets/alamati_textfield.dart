import 'package:flutter/material.dart';

class AlamatiTextField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Enter course name",
          hintStyle: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}

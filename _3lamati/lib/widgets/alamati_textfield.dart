import 'package:_3lamati/classes/alamati_courservaluenotifier.dart';
import 'package:_3lamati/classes/course_type.dart';
import 'package:flutter/material.dart';

class AlamatiTextField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final AlamatiValueNotifier notifier;
  AlamatiTextField(this.notifier);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        onSubmitted: (val) {
          CourseType temp = CourseType(courseName: val, mark: 2);
          notifier.insert(temp);
          controller.clear();
        },
      ),
    );
  }
}

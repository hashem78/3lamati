import 'package:_3lamati/classes/course_type.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AvailableChoices extends StatelessWidget {
  final List<CourseType> courses;
  AvailableChoices({this.courses});
  final List<List<CourseType>> avail = [];
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < pow(2, courses.length); ++i) {
      int counter = 0;
      List<CourseType> choices = [];
      int temp = i;
      while (temp != 0) {
        int bit = temp & 1;
        if (bit == 1) {
          choices.add(courses[counter]);
        }
        temp >>= 1;
        counter++;
      }
      avail.add(choices);
    }
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: avail.length,
        itemBuilder: (context, index) => Text(avail[index].join(' ')));
  }
}
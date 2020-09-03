import 'package:_3lamati/classes/course_type.dart';
import 'package:flutter/material.dart';

class AlamatiValueNotifier extends ValueNotifier<List<CourseType>> {
  AlamatiValueNotifier(List<CourseType> value) : super(value);
  void insert(CourseType course) {
    value.add(course);
    notifyListeners();
  }
}

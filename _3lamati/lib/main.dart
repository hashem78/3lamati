import 'package:_3lamati/classes/course_type.dart';
import 'package:_3lamati/constants.dart';
import 'package:_3lamati/widgets/available_choices.dart';
import 'package:_3lamati/classes/alamati_courservaluenotifier.dart';
import 'package:flutter/material.dart';
import 'package:_3lamati/widgets/alamati_textfield.dart';

void main() => runApp(App());

List<CourseType> courses = [];
AlamatiValueNotifier coursesNotifier = AlamatiValueNotifier(courses);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AlamatiTextField courseNameTextField = AlamatiTextField(coursesNotifier);

    String courseMarkDropDownButtonValue = "";

    var courseMarkDropdownButton = DropdownButton(
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 70,
      items:
          kdefaultMarks.map((e) => DropdownMenuItem(child: Text(e))).toList(),
      onChanged: (val) => courseMarkDropDownButtonValue = val,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  courseNameTextField,
                  SizedBox(
                    width: 50,
                  ),
                  courseMarkDropdownButton,
                  RaisedButton(
                    child: Text("Add"),
                    onPressed: () {
                      CourseType temp = CourseType(
                          courseName: courseNameTextField.controller.text);
                      temp.mark =
                          kCourseNameMarkMap[courseMarkDropDownButtonValue];
                      coursesNotifier.insert(temp);
                    },
                  ),
                ],
              ),
              Expanded(
                child: ValueListenableBuilder<List<CourseType>>(
                  builder: (context, newList, _) =>
                      AvailableChoices(courses: newList),
                  valueListenable: coursesNotifier,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
    AlamatiTextField courseNameTextField = AlamatiTextField();

    String courseMarkDropdownButtonValue = "A+";
    int courseLoadDropdownButtonValue = 1;

    var courseMarkDropdownButton = DropdownButton<String>(
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 40,
      hint: Text("Mark"),
      items: kdefaultMarks
          .map(
            (e) => DropdownMenuItem<String>(
              child: Text(e),
              value: e,
            ),
          )
          .toList(),
      onChanged: (val) {
        print("val: $val");
        courseMarkDropdownButtonValue = val;
      },
    );
    var courseLoadDropdownButton = DropdownButton<int>(
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 40,
      hint: Text("Load"),
      items: [1, 2, 3, 4, 5, 6]
          .map(
            (e) => DropdownMenuItem<int>(
              child: Text(e.toString()),
              value: e,
            ),
          )
          .toList(),
      onChanged: (val) {
        print("val: $val");
        courseLoadDropdownButtonValue = val;
      },
    );
    return GestureDetector(
      onTap: () {
        FocusNode curr = FocusScope.of(context);
        if (!curr.hasPrimaryFocus) FocusManager.instance.primaryFocus.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Row(
                  children: [
                    courseNameTextField,
                    SizedBox(
                      width: 30,
                    ),
                    courseMarkDropdownButton,
                    SizedBox(
                      width: 30,
                    ),
                    courseLoadDropdownButton,
                    RaisedButton(
                      child: Text("Add"),
                      onPressed: () {
                        print(
                            "mark${kCourseNameMarkMap[courseMarkDropdownButtonValue]}");
                        CourseType temp = CourseType(
                          courseName: courseNameTextField.controller.text,
                          mark:
                              kCourseNameMarkMap[courseMarkDropdownButtonValue],
                          courseLoad: courseLoadDropdownButtonValue,
                        );
                        coursesNotifier.insert(temp);
                        courseNameTextField.controller.clear();
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                RaisedButton(
                  onPressed: () => coursesNotifier.clear(),
                  child: Text("Clear"),
                ),
                Expanded(
                  child: ValueListenableBuilder<List<CourseType>>(
                    builder: (context, newList, _) {
                      return AvailableChoices(courses: newList);
                    },
                    valueListenable: coursesNotifier,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseType {
  String courseName;
  double mark;
  int courseLoad;
  @override
  String toString() {
    return courseName;
  }

  CourseType({this.courseName, this.mark, this.courseLoad});
}

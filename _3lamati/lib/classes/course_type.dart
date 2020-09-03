class CourseType {
  String courseName;
  double mark;
  @override
  String toString() {
    return courseName;
  }

  CourseType({this.courseName, this.mark});

  String get courseMark {
    switch (mark.toString()) {
      case "0.50":
        return "F";
      case "1.50":
        return "D-";
      case "1.75":
        return "D";
      case "2.00":
        return "D+";
      case "2.25":
        return "C-";
      case "2.50":
        return "C";
      case "2.75":
        return "C+";
      case "3.00":
        return "B-";
      case "3.25":
        return "B";
      case "3.50":
        return "B+";
      case "3.75":
        return "A-";
      case "4.00":
        return "A";
      case "4.20":
        return "A+";
    }
    return "";
  }

  set courseMark(String mark) {
    switch (mark) {
      case "F":
        this.mark = 0.5;
        break;
      case "D-":
        this.mark = 1.5;
        break;
      case "D":
        this.mark = 1.75;
        break;
      case "D+":
        this.mark = 2.00;
        break;
      case "C-":
        this.mark = 2.25;
        break;
      case "C":
        this.mark = 2.50;
        break;
      case "C+":
        this.mark = 2.75;
        break;
      case "B-":
        this.mark = 3.00;
        break;
      case "B":
        this.mark = 3.25;
        break;
      case "B+":
        this.mark = 3.5;
        break;
      case "A-":
        this.mark = 3.75;
        break;
      case "A":
        this.mark = 4.00;
        break;
      case "A+":
        this.mark = 4.20;
        break;
    }
  }
}

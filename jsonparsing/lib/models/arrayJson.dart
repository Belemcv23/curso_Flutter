/*{
"class": "XII",
"subjects": ["Maths", "Physics", "Chemistry"]
}*/

class Student{
  String standard;
  List<String> subjects;

  Student({required this.standard, required this.subjects});

  factory Student.fromJson(Map<String,dynamic> json){
    var subjectFromJson = json['subjects'];
    List<String> subjectList = List<String>.from(subjectFromJson);
    return Student(
      standard: json['class'],
      subjects: subjectList
    );
  }
}
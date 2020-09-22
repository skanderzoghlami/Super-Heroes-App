class Person {
  final int userId;
  final int id;
  final String title;

  Person({this.userId, this.id, this.title});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

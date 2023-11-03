class Task {
  int? id;
  int? isCompleted;
  int? color;
  String? note;
  String? date;
  String? title;

  Task(
      {this.id,
      this.isCompleted,
      this.color,
      this.note,
      this.date,
      this.title});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['isCompleted'] = isCompleted;
    data['color'] = color;
    data['note'] = note;
    data['date'] = date;
    data['title'] = title;
    return data;
  }

  Task.fromJson(json) {
    id = json['id'];
    isCompleted = json['isCompleted'];
    color = json['color'];
    note = json['note'].toString();
    date = json['date'].toString();
    title = json['title'].toString();
  }
}

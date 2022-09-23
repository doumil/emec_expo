class CongressClass {
  int id;
  String title;




  CongressClass(this.id, this.title);
  factory CongressClass.fromJson(dynamic json) {
    return CongressClass(json['id'] as int, json['title'] as String);
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,

    };
  }
  @override
  String toString() {
    return 'firstname : $id,lastname : $title';
  }
}

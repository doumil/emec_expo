class Notifications {
  String name;
  String date;
  String dtime;
  String discriptions;



  Notifications(this.name, this.date,this.dtime, this.discriptions);
  factory Notifications.fromJson(dynamic json) {
    return Notifications(json['name'] as String, json['date'] as String,
      json['dtime'] as String, json['discriptions'] as String);
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date,
      'dtime': dtime,
      'discriptions': discriptions,
    };
  }
  @override
  String toString() {
    return 'firstname : $name,lastname : $date,definition : $dtime,characteristic : $discriptions,';
  }
}

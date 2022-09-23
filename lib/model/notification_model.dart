class NotifClass {
  String name;
  String date;
  String dtime;
  String discriptions;



  NotifClass(this.name, this.date,this.dtime, this.discriptions);
  factory NotifClass.fromJson(dynamic json) {
    return NotifClass(json['name'] as String, json['date'] as String,
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
    return 'name : $name,date : $date,dtime : $dtime,discriptions : $discriptions,';
  }
}

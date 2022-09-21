class Speakers {
  String fname;
  String lname;
  String definition;
  String characteristic;



  Speakers(this.fname, this.lname,this.definition, this.characteristic);
  factory Speakers.fromJson(dynamic json) {
    return Speakers(json['fname'] as String, json['lname'] as String,
      json['definition'] as String, json['characteristic'] as String,);
  }
  Map<String, dynamic> toMap() {
    return {
      'fname': fname,
      'lname': lname,
      'definition': definition,
      'characteristic': characteristic,
    };
  }
  @override
  String toString() {
    return 'firstname : $lname,lastname : $fname,definition : $definition,characteristic : $characteristic,';
  }
}

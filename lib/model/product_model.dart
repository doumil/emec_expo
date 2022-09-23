class ProductClass {
  String name;
  String shortname;
  String discriptions;
  String shortdiscription;



  ProductClass(this.name, this.shortname, this.discriptions,this.shortdiscription);
  factory ProductClass.fromJson(dynamic json) {
    return ProductClass(json['name'] as String, json['shortname'] as String,
        json['discriptions'] as String,json['shortdiscription'] as String);
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': shortname,
      'discriptions': discriptions,
      'shortdiscription':shortdiscription,
    };
  }
  @override
  String toString() {
    return 'firstname : $name,lastname : $shortname,characteristic : $discriptions,shortdiscription : $shortdiscription';
  }
}

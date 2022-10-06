class ProductClass {
  String name;
  String shortname;
  String shortdiscription;
  String discriptions;




  ProductClass(this.name, this.shortname, this.shortdiscription,this.discriptions);
  factory ProductClass.fromJson(dynamic json) {
    return ProductClass(json['name'] as String, json['shortname'] as String,
        json['shortdiscription'] as String,json['discriptions'] as String);
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': shortname,
      'shortdiscription':shortdiscription,
      'discriptions': discriptions,

    };
  }
  @override
  String toString() {
    return 'firstname : $name,lastname : $shortname,shortdiscription : $shortdiscription,discriptions : $discriptions';
  }
}

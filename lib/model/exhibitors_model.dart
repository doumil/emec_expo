class ExhibitorsClass {
  String title;
  String stand;
  String discriptions;
  String shortDiscriptions;
  String adress;
  String siteweb;
  String image;





  ExhibitorsClass(this.title,this.stand, this.shortDiscriptions,this.adress, this.discriptions,this.siteweb,this.image);
  factory ExhibitorsClass.fromJson(dynamic json) {
    return ExhibitorsClass(json['title'] as String,json['stand'] as String, json['discriptions'] as String,
        json['shortDiscriptions'] as String, json['adress'] as String,json['siteweb'] as String,json['image'] as String);
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'stand':stand,
      'discriptions': discriptions,
      'shortDiscriptions': shortDiscriptions,
      'adress': adress,
      'siteweb':siteweb,
      'image':image,

    };
  }
  @override
  String toString() {
    return 'title : $title,stand : $stand,discriptions : $discriptions,shortDiscriptions : $shortDiscriptions,adress : $adress,sitweb : $siteweb,image $image';
  }
}

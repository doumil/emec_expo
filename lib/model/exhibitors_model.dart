class ExhibitorsClass {
  String title;
  String discriptions;
  String shortDiscriptions;
  String adress;
  String siteweb;





  ExhibitorsClass(this.title, this.shortDiscriptions,this.adress, this.discriptions,this.siteweb);
  factory ExhibitorsClass.fromJson(dynamic json) {
    return ExhibitorsClass(json['title'] as String, json['discriptions'] as String,
        json['shortDiscriptions'] as String, json['adress'] as String,json['siteweb'] as String);
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'discriptions': discriptions,
      'shortDiscriptions': shortDiscriptions,
      'adress': adress,
      'siteweb':siteweb,

    };
  }
  @override
  String toString() {
    return 'title : $title,discriptions : $discriptions,shortDiscriptions : $shortDiscriptions,adress : $adress,sitweb : $siteweb';
  }
}

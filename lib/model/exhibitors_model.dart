class ExhibitorsClass {
  int id;
  String title;
  String stand;
  String discriptions; //  existing field for full description
  String shortDiscriptions; //  existing field for short description
  String adress; //  existing field for address
  String siteweb; //  existing field for website
  String image; // This must be String
  bool fav;
  bool star;
  bool isRecommended;

  ExhibitorsClass(
      this.id,
      this.title,
      this.stand,
      this.shortDiscriptions,
      this.adress,
      this.discriptions,
      this.siteweb,
      this.image, // Ensure 'image' is here and is String
      this.fav,
      this.star,
      {this.isRecommended = false});

  factory ExhibitorsClass.fromJson(Map<String, dynamic> json) {
    return ExhibitorsClass(
      json['id'] as int,
      json['title'] as String,
      json['stand'] as String,
      json['shortDiscriptions'] as String,
      json['adress'] as String,
      json['discriptions'] as String,
      json['siteweb'] as String,
      json['image'] as String, // Ensure this reads as String
      json['fav'] as bool,
      json['star'] as bool,
      isRecommended: json['isRecommended'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'stand': stand,
      'discriptions': discriptions,
      'shortDiscriptions': shortDiscriptions,
      'adress': adress,
      'siteweb': siteweb,
      'image': image, // Ensure this is included
      'fav': fav,
      'star': star,
      'isRecommended': isRecommended,
    };
  }

  @override
  String toString() {
    return 'id : $id ,title : $title,stand : $stand,discriptions : $discriptions,shortDiscriptions : $shortDiscriptions,adress : $adress,siteweb : $siteweb,image $image,favorite : $fav,star $star,isRecommended $isRecommended';
  }
}
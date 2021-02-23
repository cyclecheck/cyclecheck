class Place {
  String id;
  String city;
  String adminArea;
  String adminAreaShort;
  String country;
  String countryShort;
  String postalCode;
  double lat;
  double lng;

  Place({
    this.id,
    this.city,
    this.adminArea,
    this.adminAreaShort,
    this.country,
    this.countryShort,
    this.postalCode,
    this.lat,
    this.lng,
  });

  String get displayName => [city, adminAreaShort, country]
      .where((item) => item != null || item.isNotEmpty)
      .join(', ');

  String get shortName => "$city, ${adminAreaShort ?? country ?? ""}";

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    adminArea = json['adminArea'];
    adminAreaShort = json['adminAreaShort'];
    country = json['country'];
    countryShort = json['countryShort'];
    postalCode = json['postalCode'];
    lat = json['lat'].toDouble();
    lng = json['lng'].toDouble();
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'city': this.city,
        'adminArea': this.adminArea,
        'adminAreaShort': this.adminAreaShort,
        'country': this.country,
        'countryShort': this.countryShort,
        'postalCode': this.postalCode,
        'lat': this.lat,
        'lng': this.lng,
      };
}

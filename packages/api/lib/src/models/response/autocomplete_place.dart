class AutoCompletePlace {
  String name;
  String id;

  AutoCompletePlace({
    this.name,
    this.id,
  });

  AutoCompletePlace.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  static List<AutoCompletePlace> fromList(List<dynamic> list) => list == null
      ? []
      : list.map((place) => AutoCompletePlace.fromJson(place)).toList();

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };
}

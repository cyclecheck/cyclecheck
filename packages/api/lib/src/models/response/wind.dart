class Wind {
  double degree;
  double gust;
  double speed;
  String label;
  String name;

  Wind({
    this.degree,
    this.gust,
    this.speed,
    this.label,
    this.name,
  });

  Wind.fromJson(Map<String, dynamic> json) {
    degree = json['degree'].toDouble();
    gust = json['gust'].toDouble();
    speed = json['speed'].toDouble();
    label = json['label'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
        'degree': degree,
        'gust': gust,
        'speed': speed,
        'label': label,
        'name': name,
      };
}

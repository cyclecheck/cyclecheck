class Precipitation {
  double probability;
  double intensity;

  Precipitation({
    this.probability,
    this.intensity,
  });

  Precipitation.fromJson(Map<String, dynamic> json) {
    probability = json['probability'].toDouble();
    intensity = json['intensity'].toDouble();
  }

  Map<String, dynamic> toJson() => {
        "probability": probability,
        "intensity": intensity,
      };
}

import './models.dart';

class CycleScore {
  Place place;
  Weather weather;
  CycleScoreSettings criteria;

  CycleScore({
    this.place,
    this.weather,
    this.criteria,
  });

  CycleScore.fromJson(Map<String, dynamic> json) {
    place = Place.fromJson(json['place']);
    weather = Weather.fromJson(json['weather']);
    // TODO: Figure out why the api is returning strings instead of numbers
    // criteria = CycleScoreSettings.fromJson(json['criteria']);
  }

  Map<String, dynamic> toJson() => {
        'weather': weather.toJson(),
        // 'criteria': criteria.toJson(),
      };
}

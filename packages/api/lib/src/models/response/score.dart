import 'reason.dart';

class Scores {
  Score current;
  List<Score> hourly;

  Scores({
    this.current,
    this.hourly,
  });

  Scores.fromJson(Map<String, dynamic> json) {
    current = Score.fromJson(json['current']);
    hourly = List<Score>.from(json['hourly'].map((x) => Score.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
        'current': current,
        'hourly': hourly,
      };
}

class Score {
  double value;
  List<Reason> reasons;
  List<Reason> warnings;

  Score({
    this.value,
    this.reasons,
    this.warnings,
  });

  Score.fromJson(Map<String, dynamic> json) {
    value = json['value'].toDouble();
    reasons = Reason.fromList((json['reasons']).cast<String>());
    warnings = Reason.fromList((json['warnings']).cast<String>());
  }

  Map<String, dynamic> toJson() => {
        'value': value,
        'reasons': reasons,
        'warnings': warnings,
      };
}

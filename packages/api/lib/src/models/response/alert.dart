class Alert {
  String title;
  List<String> regions;
  Severity severity;
  int time;
  int expires;
  String description;
  String uri;

  Alert({
    this.title,
    this.regions,
    this.severity,
    this.time,
    this.expires,
    this.description,
    this.uri,
  });

  Alert.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    regions = json['regions'].cast<String>();
    severity = Severity(json['severity']);
    time = json['time'];
    expires = json['expires'];
    description = json['description'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'regions': regions,
        'severity': severity,
        'time': time,
        'expires': expires,
        'description': description,
        'uri': uri,
      };
}

class Severity {
  static const String ADVISORY = 'advisory';
  static const String WATCH = 'watch';
  static const String WARNING = 'warning';

  static const List<String> ALL = [
    Severity.ADVISORY,
    Severity.WATCH,
    Severity.WARNING,
  ];

  final String value;

  const Severity(this.value);
}

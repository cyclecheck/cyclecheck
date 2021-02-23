/// Collection of app-wide constants
class Constants {
  /// The maximum allowed value for minimum temperature in celcius.
  static const MAX_VALUE_MIN_TEMP = -30.0;

  /// The maximum allowed value for maximum temperature in celcius.
  static const MAX_VALUE_MAX_TEMP = 50.0;

  /// The maximum allowed value for wind speed in km/h.
  static const MAX_VALUE_WIND = 70.0;

  /// Amount of milliseconds to delay the loading of the splash screen.
  static const DELAY_SPLASH_SCREEN = 0;

  /// Number of times a user must tap the secret button to enable developer mode.
  static const count_for_dev_mode = 8;

  /// Number of hours to show for forecast.
  static const hours_of_forecast = 12;

  static const stale_forecast_duration = const Duration(minutes: 1);
}

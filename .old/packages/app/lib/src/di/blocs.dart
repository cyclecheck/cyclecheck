import 'package:cyclecheck/src/data/cyclescore/cyclescore_repository.dart';
import 'package:cyclecheck/src/ui/screens/home/bloc/cyclescore_bloc.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/data/location/location.repository.dart';
import 'package:cyclecheck/src/data/settings/settings_repository.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/hidden_settings_bloc.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/location_bloc.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/settings_bloc.dart';

class BlocProvider {
  static settings() => ChangeNotifierProxyProvider<SettingsRepo, SettingsBloc>(
        update: (_, repo, bloc) => bloc ?? SettingsBloc(repo),
      );

  static location() =>
      ChangeNotifierProxyProvider2<SettingsRepo, LocationRepo, LocationBloc>(
        update: (_, settings, location, bloc) =>
            bloc ?? LocationBloc(settings, location),
      );

  static hiddenSettings() =>
      ChangeNotifierProxyProvider<SettingsRepo, HiddenSettingsBloc>(
        update: (_, repo, bloc) => bloc ?? HiddenSettingsBloc(repo),
      );

  static cycleScore() =>
      ChangeNotifierProxyProvider<CycleScoreRepo, CycleScoreBloc>(
        update: (_, repo, bloc) => bloc ?? CycleScoreBloc(repo),
      );
}

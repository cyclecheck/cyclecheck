import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/config/dimens.dart';
import 'package:cyclecheck/src/di/blocs.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/hidden_settings_bloc.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/advanced_settings.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/hidden_settings.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/location_settings.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/unit_settings.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider.settings(),
        BlocProvider.location(),
      ],
      child: Screen(
        titleText: Text("Settings"),
        titleColor: AppColors.primary,
        scrollable: true,
        constraints: BoxConstraints(maxWidth: 325),
        children: [
          SettingGroup(
            child: LocationSettings(),
          ),
          SettingGroup(
            child: UnitSettings(),
          ),
          SettingGroup(
            child: AdvancedSettings(),
          ),
          if (Provider.of<HiddenSettingsBloc>(context).state.isDeveloperMode)
            SettingGroup(
              child: HiddenSettings(),
            ),
          Padding(padding: const EdgeInsets.only(top: 20.0)),
        ],
      ),
    );
  }
}

class SettingGroup extends StatelessWidget {
  final Widget child;
  final double bottomPadding;
  final EdgeInsets padding;

  const SettingGroup({
    Key key,
    @required this.child,
    this.bottomPadding = Dimens.setting_group_bottom_padding,
    this.padding,
  })  : assert(child != null),
        assert(bottomPadding != null || padding != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: bottomPadding),
      child: child,
    );
  }
}

import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/config/dimens.dart';
import 'package:cyclecheck/src/data/settings/settings_repository.dart';
import 'package:cyclecheck/src/ui/screens/onboarding/onboarding_screen.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/settings_bloc.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/advanced_settings.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen_header.dart';
import 'package:cyclecheck/src/ui/widgets/accent_icon_button.dart';
import 'package:cyclecheck/src/ui/widgets/expanded_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinalPage extends StatelessWidget {
  static const routeName = "final";

  final VoidCallback onNext;

  FinalPage({
    Key key,
    @required this.onNext,
  })  : assert(onNext != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      header: ScreenHeader(
        text: "Almost done!",
        dividerWidth: 300,
      ),
      constraints: Dimens.onboarding_page_width,
      children: [
        ExpandedColumn(
          children: [
            Text(
              "Congradulations on making it this far!",
              style: TextStyle(fontSize: 18),
            ),
            Padding(padding: EdgeInsets.only(bottom: 32)),
            Icon(Icons.directions_bike, size: 80),
            Padding(padding: EdgeInsets.only(bottom: 32)),
            Text(
              "You're close to the finish line!  By default CycleCheck scores the weather based on a few criteria, like temperature, windspeed and precipitation.",
            ),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            Text(
                "If you want some control over those variables, then you can configure them below.  If not, just smash that finish button!"),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            _AdvancedSettingsButton(),
          ],
        ),
        OnboardingContinueButton(
          onNext,
          continueButton: AccentIconButton(
              text: "Finish",
              trailing: Icon(Icons.check),
              onPressed: () {
                Provider.of<SettingsRepo>(context).toggleOnboardingFlag();
                onNext();
              }),
        ),
      ],
    );
  }
}

class _AdvancedSettingsButton extends StatelessWidget {
  const _AdvancedSettingsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccentIconButton(
      text: "Configure advanced settings",
      trailing: Icon(Icons.settings, size: 17),
      onPressed: () => _showAdvancedSettings(context),
    );
  }

  _showAdvancedSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.primary,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(left: 32, right: 32, top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdvancedSettings(),
              Padding(padding: EdgeInsets.only(bottom: 32)),
              Align(
                alignment: Alignment.centerRight,
                child: AccentIconButton(
                  text: "Finished",
                  trailing: Icon(Icons.arrow_downward),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

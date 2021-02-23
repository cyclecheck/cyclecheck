import 'package:cyclecheck/src/config/dimens.dart';
import 'package:cyclecheck/src/ui/screens/onboarding/onboarding_screen.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/location_bloc.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/location_settings.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen_header.dart';
import 'package:cyclecheck/src/ui/widgets/empty.dart';
import 'package:cyclecheck/src/ui/widgets/expanded_column.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LocationPage extends StatelessWidget {
  static const routeName = "location";

  final VoidCallback onNext;

  LocationPage({
    Key key,
    @required this.onNext,
  })  : assert(onNext != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      header: ScreenHeader(
        text: "Location",
        dividerWidth: 300,
      ),
      constraints: Dimens.onboarding_page_width,
      children: [
        ExpandedColumn(
          children: [
            Text(
              "Your location is required in order to get accurate weather information.  You have the option of using your phone's GPS or searching for your city.",
            ),
            Padding(padding: const EdgeInsets.all(8.0)),
            Text(
              "If you wish to use the GPS, you will need to allow CycleCheck access to your rough location.  This information is never stored anywhere but on your phone.",
              style: TextStyle(fontSize: 16),
            ),
            Padding(padding: const EdgeInsets.all(16.0)),
            Consumer<LocationBloc>(
              builder: (context, LocationBloc value, _) {
                return AnimatedOpacity(
                  opacity: value.state.place == null ? 0 : 1,
                  duration: Duration(milliseconds: 150),
                  child: _buildFoundLocation(value.state.place),
                );
              },
            ),
            LocationButtons(),
          ],
        ),
        Consumer<LocationBloc>(
          child: OnboardingContinueButton(onNext),
          builder: (context, bloc, child) {
            return bloc.state.place != null ? child : Empty.min();
          },
        ),
      ],
    );
  }

  Widget _buildFoundLocation(Place place) => Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Selected location:"),
            Text(
              place != null ? place.shortName : "",
              style: TextStyle(fontSize: 28.0),
            ),
          ],
        ),
      );
}

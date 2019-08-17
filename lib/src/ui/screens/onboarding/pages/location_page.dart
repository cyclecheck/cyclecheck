import 'package:cyclecheck/src/di/blocs.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/location_bloc.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/location_settings.dart';
import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

class LocationPage extends OnboardingPage {
  static const routeName = "location";

  LocationPage() : super("Location");

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider.location(),
      ],
      child: Column(
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
          _Location(),
        ],
      ),
    );
  }
}

class _Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocationButtons(),
        Consumer<LocationBloc>(
          builder: (context, LocationBloc value, _) {
            return Text("Selected city: ${value.state.place.shortName}");
          },
        ),
      ],
    );
  }
}

import 'package:cyclecheck/src/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/ui/screens/settings/blocs/location_bloc.dart';
import 'package:cyclecheck/src/ui/widgets/accent_outline_button.dart';

class LocationSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationBloc>(
      builder: (context, value, child) {
        final state = value.state;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location:',
              style: Styles.txt_setting_title,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: LocationButton(),
            ),
            if (state.place != null) Text("Selected: ${state.place.city}"),
          ],
        );
      },
    );
  }
}

class LocationButton extends StatelessWidget {
  final String text;

  const LocationButton({
    Key key,
    this.text = "Get Location",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LocationBloc>(context);
    final statusIcon = _getStatusIcon(bloc.state);

    return AccentOutlineButton(
      onPressed: bloc.getCurrentLocation,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          if (statusIcon != null)
            Padding(
              padding: EdgeInsets.only(left: 4),
              child: Icon(
                statusIcon,
                size: 14,
              ),
            )
        ],
      ),
    );
  }

  IconData _getStatusIcon(LocationState state) {
    if (state.currentPlaceSuccess || state.place != null) return Icons.check;
    if (state.currentPlaceError != null) return Icons.error;
    return null;
  }
}

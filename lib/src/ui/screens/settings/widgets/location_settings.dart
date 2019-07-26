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
              child: _createLocationButton(value),
            ),
            if (state.place != null) Text("Selected: ${state.place.city}"),
          ],
        );
      },
    );
  }

  Widget _createLocationButton(LocationBloc bloc) {
    final statusIcon = _getStatusIcon(bloc.state);

    return AccentOutlineButton(
      onPressed: bloc.getCurrentLocation,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Get Location"),
          if (statusIcon != null)
            Padding(
                padding: EdgeInsets.only(left: 4),
                child: Icon(
                  statusIcon,
                  size: 14,
                ))
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

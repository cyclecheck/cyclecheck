import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/config/styles.dart';
import 'package:cyclecheck/src/data/location/location.repository.dart';
import 'package:cyclecheck/src/ui/widgets/location_search_dialog.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/location_bloc.dart';
import 'package:cyclecheck/src/ui/widgets/accent_outline_button.dart';

class LocationSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationBloc>(
      builder: (context, bloc, child) {
        final state = bloc.state;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Location:',
                style: Styles.txt_setting_title,
              ),
            ),
            LocationButtons(),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                state.place == null
                    ? "No location selected."
                    : "You've selected ${state.place.shortName}.",
              ),
            ),
          ],
        );
      },
    );
  }
}

class LocationButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CurrentLocationButton(),
        Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
        SearchLocationButton(),
      ],
    );
  }
}

class CurrentLocationButton extends StatelessWidget {
  final String text;

  const CurrentLocationButton({
    Key key,
    this.text = "Current",
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
            ),
        ],
      ),
    );
  }

  IconData _getStatusIcon(LocationState state) {
    if (state.currentPlaceSuccess) return Icons.check;
    if (state.currentPlaceError != null) return Icons.error;
    return Icons.location_on;
  }
}

class SearchLocationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccentOutlineButton(
      onPressed: () => _showPlaceSearchDialog(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Search"),
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Icon(
              Icons.search,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }

  _showPlaceSearchDialog(BuildContext context) async {
    final repo = Provider.of<LocationRepo>(context);
    final result = await Navigator.of(context).push(LocationSearch(repo));
    if (result != null) {
      Provider.of<LocationBloc>(context).setSelectedPlace(result.id);
    }
  }
}

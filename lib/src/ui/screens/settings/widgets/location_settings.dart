import 'package:cyclecheck_api/cyclecheck_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/config/styles.dart';
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
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LocationButton(),
                Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                SearchLocationButton(),
              ],
            ),
            if (state.place != null)
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text("Selected: ${state.place.city}"),
              ),
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

  _showPlaceSearchDialog(BuildContext context) {
    final bloc = Provider.of<LocationBloc>(context);
    showDialog(
      context: context,
      builder: (context) {
        return LocationSearch(bloc: bloc);
      },
    );
  }
}

class LocationSearch extends StatefulWidget {
  final LocationBloc bloc;

  LocationSearch({Key key, @required this.bloc}) : super(key: key);

  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: EdgeInsets.only(left: 32, right: 32, top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: TypeAheadField<AutoCompletePlace>(
                suggestionsBoxVerticalOffset: 14,
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  color: Theme.of(context).primaryColor,
                  elevation: 0,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                ),
                textFieldConfiguration: TextFieldConfiguration(
                  autofocus: true,
                  decoration: InputDecoration.collapsed(
                    hintText: "Search...",
                  ),
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(fontSize: 16),
                ),
                suggestionsCallback: (input) => widget.bloc.search(input),
                onSuggestionSelected: (place) =>
                    widget.bloc.setSelectedPlace(place.id),
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    leading: Icon(Icons.place),
                    title: Text(suggestion.name),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

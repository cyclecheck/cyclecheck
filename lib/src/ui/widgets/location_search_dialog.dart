import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';

import 'package:cyclecheck/src/data/location/location.repository.dart';

class LocationSearch extends ModalRoute<AutoCompletePlace> {
  final LocationRepo repo;

  LocationSearch(this.repo);

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return SafeArea(
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
              child: Material(
                  type: MaterialType.transparency,
                  child: _buildSearchBox(context)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }

  TypeAheadField<AutoCompletePlace> _buildSearchBox(BuildContext context) {
    return TypeAheadField<AutoCompletePlace>(
      textFieldConfiguration: TextFieldConfiguration(
        autofocus: true,
        decoration: InputDecoration.collapsed(
          hintText: "Search...",
        ),
        textCapitalization: TextCapitalization.words,
        style: TextStyle(fontSize: 16),
      ),
      suggestionsBoxVerticalOffset: 14,
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        color: Theme.of(context).primaryColor,
        elevation: 0,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      suggestionsCallback: (input) => repo.searchPlace(input),
      onSuggestionSelected: (place) {
        Navigator.of(context).pop(place);
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: Icon(Icons.place),
          title: Text(suggestion.name),
        );
      },
    );
  }
}

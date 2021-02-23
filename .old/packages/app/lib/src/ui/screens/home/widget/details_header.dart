import 'package:cyclecheck/src/ui/screens/home/bloc/cyclescore_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago_flutter/timeago_flutter.dart';

import 'package:cyclecheck/src/config/dimens.dart';
import 'package:cyclecheck/src/ui/widgets/accent_line.dart';

class DetailsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: Dimens.max_width_screen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Details", style: Theme.of(context).textTheme.subtitle),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: AccentLine(width: double.infinity),
          ),
          Consumer<CycleScoreBloc>(
            builder: (context, bloc, child) {
              return Timeago(
                date: bloc.state.score.weather.current.forecastedTime,
                builder: (_, value) => Text(
                  "Last updated $value",
                  style: TextStyle(fontSize: 10),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

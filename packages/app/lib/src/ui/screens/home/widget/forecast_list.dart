import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/config/dimens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/ui/screens/home/bloc/cyclescore_bloc.dart';
import 'package:cyclecheck/src/ui/screens/home/widget/hour_forecast.dart';

class ForecastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CycleScoreBloc>(context);

    return Container(
      height: 180,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: bloc.state.forecast.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => bloc.setSelected(index),
            borderRadius: BorderRadius.circular(Dimens.border_radius),
            child: HourForecast(
              block: bloc.state.forecast[index],
              isNow: false,
              selected: bloc.state.selected == index,
            ),
          );
        },
      ),
    );
  }
}

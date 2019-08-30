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
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: bloc.state.forecast.length,
        itemBuilder: (BuildContext context, int index) {
          final item = InkWell(
            onTap: () => bloc.setSelected(index),
            borderRadius: BorderRadius.circular(Dimens.border_radius),
            child: HourForecast(
              block: bloc.state.forecast[index],
              isNow: false,
              selected: bloc.state.selectedIndex == index,
            ),
          );

          return index != 0
              ? item
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.only(left: 32)),
                    Container(child: item, height: double.infinity),
                  ],
                );
        },
      ),
    );
  }
}

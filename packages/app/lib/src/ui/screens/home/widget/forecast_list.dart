import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/config/dimens.dart';
import 'package:cyclecheck/src/ui/widgets/empty.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/ui/screens/home/bloc/cyclescore_bloc.dart';
import 'package:cyclecheck/src/ui/screens/home/widget/hour_forecast.dart';

class ForecastList extends StatefulWidget {
  @override
  _ForecastListState createState() => _ForecastListState();
}

class _ForecastListState extends State<ForecastList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CycleScoreBloc>(context);

    return Container(
      height: 180,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (!(notification is ScrollUpdateNotification)) return false;

          final index = _calculateScrolledIndex(bloc.state.forecast.length);
          bloc.setSelected(index);
          return true;
        },
        child: bloc.state.forecast.isEmpty
            ? Empty.min()
            : _buildForecast(context, bloc),
      ),
    );
  }

  Widget _buildForecast(BuildContext context, CycleScoreBloc bloc) {
    return ListView.builder(
      shrinkWrap: false,
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: null,
      itemBuilder: (BuildContext context, int literalIndex) {
        final index =
            _calculateRealIndex(literalIndex, bloc.state.forecast.length);

        final item = InkWell(
          onTap: () async {
            if (index == bloc.state.selectedIndex) return;

            _scrollController.animateTo(
              literalIndex * HourForecast.ITEM_WIDTH,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          borderRadius: BorderRadius.circular(Dimens.border_radius),
          child: HourForecast(
            block: bloc.state.forecast[index],
            selected: bloc.state.selectedIndex == index,
          ),
        );

        final isFirstItem = index == 0;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isFirstItem && literalIndex == 0)
              Padding(padding: const EdgeInsets.only(left: 32)),
            Container(
              child: item,
              height: double.infinity,
              decoration: isFirstItem
                  ? BoxDecoration(
                      border: Border(
                        left: BorderSide(color: AppColors.accent),
                      ),
                    )
                  : null,
            ),
          ],
        );
      },
    );
  }

  int _calculateScrolledIndex(int length) {
    final index = (_scrollController.offset / HourForecast.ITEM_WIDTH).round();
    return _calculateRealIndex(index, length);
  }

  int _calculateRealIndex(int index, int length) {
    if (length == 0) return 0;

    final modulo = index % length;
    return modulo.abs();
  }
}

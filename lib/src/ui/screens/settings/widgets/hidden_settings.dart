import 'package:cyclecheck/src/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/ui/screens/settings/blocs/hidden_settings_bloc.dart';
import 'package:cyclecheck/src/ui/widgets/divider_text.dart';

class HiddenSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HiddenSettingsBloc>(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DividerText(
            text: "Hidden Settings",
            dividerWidth: 175,
          ),
          Container(
            child: Text(
                "Here be some secret settings, continue at your own risk!"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Show onboarding on next launch"),
              Switch(
                value: !bloc.state.showOnboarding,
                activeColor: AppColors.accent,
                onChanged: (value) => bloc.toggleOnboardingFlag(),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Developer mode"),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      "Disabling will hide these settings.",
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
              Switch(
                value: bloc.state.isDeveloperMode,
                activeColor: AppColors.accent,
                onChanged: (value) => bloc.toggleDevMode(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

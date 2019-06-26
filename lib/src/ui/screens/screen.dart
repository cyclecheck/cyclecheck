import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class StatelessScreen extends StatelessWidget {
  @protected
  static String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: buildScreen(context),
      ),
    );
  }

  @protected
  Widget buildScreen(BuildContext context);
}

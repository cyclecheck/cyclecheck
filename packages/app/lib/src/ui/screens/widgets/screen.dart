import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen extends StatelessWidget {
  final Widget header;
  final List<Widget> children;
  final EdgeInsets margin;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final AppBar appBar;
  final List<Widget> appBarActions;
  final Widget titleText;
  final Color titleColor;
  final bool scrollable;
  final double width;
  final BoxConstraints constraints;
  final List<SingleChildCloneableWidget> providers;

  const Screen({
    Key key,
    this.header,
    @required this.children,
    this.margin = const EdgeInsets.only(left: 32.0),
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.appBar,
    this.appBarActions,
    this.titleText,
    this.titleColor,
    this.scrollable = false,
    this.width = double.infinity,
    this.constraints,
    this.providers = const [],
  })  : assert(children != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar ?? _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() => AppBar(
        backgroundColor: titleColor ?? Colors.transparent,
        elevation: 0,
        title: titleText,
        actions: appBarActions,
      );

  Widget _buildBody() => SafeArea(
        child: scrollable
            ? SingleChildScrollView(
                child: _buildContainer(),
              )
            : _buildContainer(),
      );

  Widget _buildContainer() => Container(
        margin: margin,
        width: width,
        constraints: constraints,
        child: providers.isNotEmpty
            ? MultiProvider(
                providers: providers,
                child: _buildColumn(),
              )
            : _buildColumn(),
      );

  Widget _buildColumn() => Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          if (header != null) header,
          ...children,
        ],
      );
}

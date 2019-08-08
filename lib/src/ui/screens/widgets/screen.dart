import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Widget header;
  final List<Widget> children;
  final EdgeInsets margin;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final AppBar appBar;
  final Widget titleText;
  final Color titleColor;
  final bool scrollable;

  const Screen({
    Key key,
    this.header,
    @required this.children,
    this.margin = const EdgeInsets.symmetric(horizontal: 32.0),
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.appBar,
    this.titleText,
    this.titleColor,
    this.scrollable = false,
  })  : assert(children != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar ??
          AppBar(
            backgroundColor: titleColor ?? Colors.transparent,
            elevation: 0,
            title: titleText,
          ),
      body: header == null
          ? Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: _buildBody(),
            )
          : _buildBody(),
    );
  }

  Widget _buildBody() => SafeArea(
        child: Container(
            margin: margin,
            width: double.infinity,
            child: scrollable
                ? SingleChildScrollView(child: _buildContent())
                : _buildContent()),
      );

  Widget _buildContent() => Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          if (header != null) header,
          ...children,
        ],
      );
}

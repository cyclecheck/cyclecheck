import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Widget header;
  final List<Widget> children;
  final EdgeInsets margin;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const Screen({
    Key key,
    this.header,
    @required this.children,
    this.margin = const EdgeInsets.symmetric(horizontal: 32.0),
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  })  : assert(children != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: margin,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            mainAxisAlignment: mainAxisAlignment,
            children: [
              if (header != null) header,
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}

// bottomNavigationBar: BottomAppBar(
//         elevation: 0,
//         color: Colors.transparent,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Icon(Icons.arrow_back_ios),
//             ],
//           ),
//         ),
//       ),

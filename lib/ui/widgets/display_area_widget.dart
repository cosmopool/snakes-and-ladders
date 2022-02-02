import 'package:flutter/material.dart';

class DisplayAreaWidget extends StatefulWidget {
  const DisplayAreaWidget({Key? key}) : super(key: key);

  @override
  _DisplayAreaWidgetState createState() => _DisplayAreaWidgetState();
}

class _DisplayAreaWidgetState extends State<DisplayAreaWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight - screenHeight * .15 - screenWidth,
      // decoration: const BoxDecoration(
      //   color: Colors.green,
      // ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MessageContainerWidget extends StatefulWidget {
  final String message;
  final bool controller;
  const MessageContainerWidget(
      {Key? key, required this.message, required this.controller})
      : super(key: key);

  @override
  _MessageContainerWidgetState createState() => _MessageContainerWidgetState();
}

class _MessageContainerWidgetState extends State<MessageContainerWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return AnimatedPositioned(
      // left: (widget.controller) ? screenWidth / 2 - 130 : -400,
      // left: 30,
      top: (widget.controller) ? 80 : -400,
      duration: const Duration(seconds: 1),
      curve: Curves.elasticOut,
      child: SizedBox(
        width: screenWidth * .9,
        child: AutoSizeText(
          widget.message,
          style: const TextStyle(
            fontSize: 30.0,
            color: Colors.yellow,
            fontFamily: 'hindi',
            decoration: TextDecoration.none,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 3.0),
                blurRadius: 10.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snakes_and_ladders/ui/widgets/board_widget.dart';
import 'package:snakes_and_ladders/ui/widgets/buttons_area_widget.dart';
import 'package:snakes_and_ladders/ui/widgets/display_area_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.lightBlue[900],
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/tile_background.png'),
              fit: BoxFit.cover)),
      child: Column(
        children: const [
          BoardWidget(),
          DisplayAreaWidget(),
          ButtonsAreaWidget()
        ],
      ),
    );
  }
}

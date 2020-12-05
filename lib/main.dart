import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'CalculatorScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    initialRoute: '/calculator',
    routes: {'/calculator': (context) => CalculatorScreen()},
  ));
}

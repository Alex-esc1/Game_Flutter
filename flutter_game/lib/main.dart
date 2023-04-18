import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/loop.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight
    ]);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Center(
      child: Text('Game'),
    ),
  ));
}

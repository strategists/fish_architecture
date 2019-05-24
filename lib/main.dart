import 'package:flutter/material.dart';
import 'app.dart';
import 'package:flutter/services.dart';

void main() {
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  runApp(createApp());
}

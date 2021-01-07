import 'package:flutter/material.dart';
import 'package:daily_schedule/shared/constants.dart';

import 'package:daily_schedule/app/app.dart';
void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text("My Daily Schedule"),
      centerTitle: true,
    )
  ),
));
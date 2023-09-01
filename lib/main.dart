import 'package:flutter/material.dart';
import 'package:project_2/choose_location.dart';
import 'package:project_2/home.dart';
import 'package:project_2/loading.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));

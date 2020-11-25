import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica_design/src/pages/basico_page.dart';
import 'package:practica_design/src/pages/charts_page.dart';
import 'package:practica_design/src/pages/grid_page.dart';
import 'package:practica_design/src/pages/scroll_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    //   systemNavigationBarColor: Colors.black
    // ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseñitos',
      initialRoute: 'grid',
      routes: {
        'basico' : (BuildContext context ) => BasicoPage(),
        'scroll' : (BuildContext context ) => ScrollPage(),
        'grid' : (BuildContext context ) => GridPage(),
        'chart' : (BuildContext context ) => ChartsPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';

//My imports
import 'package:moviesapp_flutter/src/pages/home_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Peliculas',
            initialRoute: '/',
            routes: {
                '/' : (BuildContext context) => HomePage(),
            },
        );
    }
}

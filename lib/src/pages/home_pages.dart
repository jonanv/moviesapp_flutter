import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Películas en cines'),
                backgroundColor: Colors.indigoAccent,
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                    )
                ],
            ),
            body: SafeArea(
                child: Text('Hola mundo'),
            )
        );
  }
}

import 'package:flutter/material.dart';

//My imports
import 'package:moviesapp_flutter/src/widgets/card_swiper_widget.dart';
import 'package:moviesapp_flutter/src/providers/peliculas_provider.dart';

class HomePage extends StatelessWidget {

    Widget _swiperTarjetas() {
        final peliculasProvider = new PeliculasProvider();
        peliculasProvider.getEnCines();

        return CardSwiper(
            peliculas: [1,2,3,4,5],
        );
    }

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
            body: Container(
                child: Column(
                    children: <Widget>[
                        _swiperTarjetas()
                    ],
                ),
            )
        );
    }
}

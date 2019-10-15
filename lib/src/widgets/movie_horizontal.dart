import 'package:flutter/material.dart';

//My imports
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:moviesapp_flutter/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
    final List<Pelicula> peliculas;

    MovieHorizontal({@required this.peliculas});

    List<Widget> _tarjetas() {
        return peliculas.map((pelicula) {
            return Container(
                margin: EdgeInsets.only(right: 15.0),
                child: Column(
                    children: <Widget>[
                        FadeInImage(
                            image: NetworkImage(pelicula.getPosterImg()),
                            placeholder: AssetImage('assents/img/no-img.jpg'),
                            fit: BoxFit.cover,
                            height: 160.0,
                        )
                    ],
                ),
            );
        }).toList();
    }

    @override
    Widget build(BuildContext context) {
        final _screenSize = MediaQuery.of(context).size;

        return Container(
            height: _screenSize.height * 0.2,
            child: PageView(
                children: _tarjetas(),
            ),
        );
    }
}
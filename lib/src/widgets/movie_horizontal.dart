import 'package:flutter/material.dart';

//My imports
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:moviesapp_flutter/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
    final List<Pelicula> peliculas;

    MovieHorizontal({@required this.peliculas});

    List<Widget> _tarjetas(BuildContext context) {
        return peliculas.map((pelicula) {
            return Container(
                margin: EdgeInsets.only(right: 15.0),
                child: Column(
                    children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: FadeInImage(
                                image: NetworkImage(pelicula.getPosterImg()),
                                placeholder: AssetImage('assets/img/no-image.jpg'),
                                fit: BoxFit.cover,
                                height: 160.0,
                            ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                            pelicula.title,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.caption,
                        ),
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
                pageSnapping: false,
                controller: PageController(
                    initialPage: 1,
                    viewportFraction: 3.0,
                ),
                children: _tarjetas(context),
            ),
        );
    }
}
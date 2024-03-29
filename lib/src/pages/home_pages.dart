import 'package:flutter/material.dart';

//My imports
import 'package:moviesapp_flutter/src/widgets/card_swiper_widget.dart';
import 'package:moviesapp_flutter/src/providers/peliculas_provider.dart';
import 'package:moviesapp_flutter/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
    final peliculasProvider = new PeliculasProvider();

    Widget _swiperTarjetas() {
        return FutureBuilder(
            future: peliculasProvider.getEnCines(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if(snapshot.hasData) {
                    return CardSwiper(peliculas: snapshot.data);
                }
                else {
                    return Container(
                        height: 400.0,
                        child: Center(
                            child: CircularProgressIndicator()
                        )
                    );
                }
            },
        );
    }

    Widget _footer(BuildContext context) {
        return Container(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text('Populares', style: Theme.of(context).textTheme.subhead)
                    ),
                    SizedBox(height: 5.0),
                    FutureBuilder(
                        future: peliculasProvider.getPopulares(),
                        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                            // snapshot.data?.forEach((p) => print(p.title));
                            if(snapshot.hasData) {
                                return MovieHorizontal(peliculas: snapshot.data);
                            }
                            else {
                                return Center(child: CircularProgressIndicator());
                            }
                        },
                    ),
                ],
            )
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                        _swiperTarjetas(),
                        _footer(context),
                    ],
                ),
            )
        );
    }
}

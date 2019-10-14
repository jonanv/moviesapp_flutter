import 'package:http/http.dart' as http;

import 'dart:convert';

//My imports
import 'package:moviesapp_flutter/src/models/pelicula_model.dart';

class PeliculasProvider {
    String _apikey    = 'eeba7a481f04ca04446e13ca95af978d';
    String _url       = 'api.themoviedb.org';
    String _language  = 'es-ES';

    Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
        final resp = await http.get(url);
        final decodeData = json.decode(resp.body);

        final peliculas = new Peliculas.fromJsonList(decodeData['results']);
        // print(peliculas.items[0].title);

        return peliculas.items;
    }

    Future<List<Pelicula>> getEnCines() async {
        final url = Uri.https(_url, '3/movie/now_playing', {
            'api_key'   : _apikey,
            'language'  : _language
        });
        return await _procesarRespuesta(url);
    }

    Future<List<Pelicula>> getPopulares() async {
        final url = Uri.https(_url, '3/movie/popular', {
            'api_key'   : _apikey,
            'language'  : _language
        });
        return await _procesarRespuesta(url);
    }
}
import 'package:http/http.dart' as http;

import 'dart:convert';

//My imports
import 'package:moviesapp_flutter/src/models/pelicula_model.dart';

class PeliculasProvider {
    String _apikey    = 'eeba7a481f04ca04446e13ca95af978d';
    String _url       = 'api.themoviedb.org';
    String _language  = 'es-ES';

    Future<List<Pelicula>> getEnCines() async {
        final url = Uri.https(_url, '3/movie/now_playing', {
            'api_key'   : _apikey,
            'language'  : _language
        });

        final resp = await http.get(url);
        final decodeData = json.decode(resp.body);

        print(decodeData);

        return [];
    }
}
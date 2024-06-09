import 'dart:convert';

import 'package:http/http.dart';
import '../api/url.dart';
import '../methods/get_response.dart';
import '../models/song_model.dart';

class GetOneSong {
  Future<List<SongModel>> getSongs() async {

       var hardCodedSongs = [
        {
          'songid': 'ff5e46b5-1035-439b-bc12-bd180a0a84d3',
          'songname': 'Both of Us',
          'userid': 'Madi',
          'trackid': 'https://cdn.pixabay.com/download/audio/2022/01/12/audio_45cacdef8f.mp3?filename=both-of-us-14037.mp3',
          'duration': '2:48',
          'cover_image_url': 'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNjQwNTF8MHwxfHNlYXJjaHw2NXx8ZmFjZXxlbnwwfHx8fDE2MzQzODAyNDI&ixlib=rb-1.2.1&q=80&w=1080',
          'first_name': 'D',
          'last_name': 'J'
        }
    ];

return Future.value(hardCodedSongs.map((song) => SongModel.fromJson(song)).toList());

    // Find the song with the given name
    // var song = hardCodedSongs.firstWhere((song) => song['songname'] == name, orElse: () => null);

    // if (song != null) {
    //     return Future.value(SongModel.fromJson(song));
    // } else {
    //     return Future.error('Song not found');
    // }

    // Response res =
    //     await getResponse(Uri.https(baseUrl, basePath + '/songs/one/' + name));
    // if (res.statusCode == 200) {
    //   var body = jsonDecode(res.body);

    //   return SongModel.fromJson(body['results'][0]);
    // } else {
    //   throw Exception("failed fetch users ");
    // }
  }
}

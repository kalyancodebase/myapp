import 'dart:convert';

import 'package:http/http.dart';
import '../api/url.dart';
import '../methods/get_response.dart';
import '../models/song_model.dart';
import '../models/user.dart';

class SearchRepository {
  Future<List<User>> getUsers(String tag) async {

     var hardCodedUsers = [
        {
  "avatar": "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNjQwNTF8MHwxfHNlYXJjaHwxfHxmYWNlfGVufDB8fHx8MTY0MjIzNTIwMA&ixlib=rb-1.2.1&q=80&w=1080",
  "username": "Madi",
  "first_name": "D",
  "last_name": "J"
}
    ];

   
    var userList = hardCodedUsers.map((user) => User.fromJson(user)).toList();

    return Future.value(userList);

    // final query = {
    //   "page": 0.toString(),
    //   "limit": 50.toString(),
    //   "q": tag,
    // };

    // Response res = await getResponse(
    //     Uri.https(baseUrl, basePath + '/search/artists', query));
    // if (res.statusCode == 200) {
    //   var body = jsonDecode(res.body);
    //   return (body['results'] as List).map((e) => User.fromJson(e)).toList();
    // } else {
    //   throw Exception("failed fetch users ");
    // }
  }

  Future<List<SongModel>> getSongs(String tag) async {

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



    // final query = {
    //   "page": 0.toString(),
    //   "limit": 50.toString(),
    //   "q": tag,
    // };

    // Response res = await getResponse(
    //     Uri.https(baseUrl, basePath + '/search/songs', query));
    // if (res.statusCode == 200) {
    //   var body = jsonDecode(res.body);

    //   return (body['results'] as List)
    //       .map((e) => SongModel.fromJson(e))
    //       .toList();
    // } else {
    //   throw Exception("failed fetch users ");
    // }
  }
}

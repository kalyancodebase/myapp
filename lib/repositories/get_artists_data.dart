import 'dart:convert';

import '../api/url.dart';
import '../methods/get_response.dart';
import '../models/song_model.dart';
import '../models/user_model.dart';

class GetArtistsData {

  Future<UserModel> getUserData(String id) async {
    // final value =
    //     await getResponse(Uri.https(baseUrl, basePath + '/user/' + id));

    // if (value.statusCode == 200) {
    //   final body = jsonDecode(value.body);

    //   return UserModel.fromJson(body['results']);
    // } else {
    //   throw Exception('Failed to load data');
    // }

var hardCodedUsers = [
        {
           'id': 'd7cacfb3-dcf2-4632-83d8-2faf600ceab1',
           'username': 'Madi',
           'firstname': 'D',
           'lastname': 'J',
           'email': 'dJell0@cdc.gov',
           'city': 'lugulu',
           'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNjQwNTF8MHwxfHNlYXJjaHwxfHxmYWNlfGVufDB8fHx8MTY0MjIzNTIwMA&ixlib=rb-1.2.1&q=80&w=1080',
        }
    ];


  var userList = hardCodedUsers.map((user) => UserModel.fromJson(user)).toList();
  var user = userList.firstWhere((user) => user.id == id);

  return Future.value(user);

      
  }

  Future<List<SongModel>> getSongs(String id) async {

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



    // final value =
    //     await getResponse(Uri.https(baseUrl, basePath + '/songs/' + id, {
    //   "page": 0.toString(),
    //   "limit": 100.toString(),
    // }));
    // if (value.statusCode == 200) {
    //   final body = jsonDecode(value.body);
    //   return ((body['results'] as List)
    //       .map((e) => SongModel.fromJson(e))
    //       .toList());
    // } else {
    //   throw Exception('Failed to load data');
    // }
  }
}

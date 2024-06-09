import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import '../api/url.dart';
import '../methods/get_response.dart';
import '../models/song_model.dart';
import '../models/user.dart';

// import 'package:googleapis/drive/v3.dart' as drive;
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/services.dart';

final _SCOPES = [
  'https://www.googleapis.com/auth/drive.metadata',
];

class GetHomePage {
  Future<List<User>> getUsers() async {

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

    // final Map<String, String> query = {
    //   "page": 0.toString(),
    //   "limit": 26.toString()
    // };
    // Response res =
    //     await getResponse(Uri.https(baseUrl, basePath + '/users', query));
    // if (res.statusCode == 200) {
    //   final body = jsonDecode(res.body);
    //   print(body);
    //   final users = (body['results'] as List)
    //       .map<User>((user) => User.fromJson(user))
    //       .toList();

    //   return users;
    // } else {
    //   throw Exception('Failed to load users');
    // }
  }

//   late Future<drive.DriveApi> _driveApiFuture;
//   late List<drive.File> _files = [];



//     Future<drive.DriveApi> _initializeDriveApi() async {
//     try {
//         final serviceAccountJson = await _getServiceAccountJson();
//         final _credentials = ServiceAccountCredentials.fromJson(serviceAccountJson);
   
//       final client = await clientViaServiceAccount(_credentials, _SCOPES);

//       final driveApi = drive.DriveApi(client);

//       _listFilesFromFolder(driveApi, '1OR0PvEHdCF1nUInsrd1REbpeFByyzZep');

//       return driveApi;
//     } catch (e) {
//       print('Error initializing Drive API: $e');
//       rethrow; // Rethrow the exception to propagate it to the FutureBuilder
//     }
//   }

//   Future<Map<String, dynamic>> _getServiceAccountJson() async {
//     final jsonString = await rootBundle.loadString('assets/service_account.json');
//     return jsonDecode(jsonString);
//   }

// Future<void> _listFilesFromFolder(
//       drive.DriveApi driveApi, String folderId) async {
//     try {
//       // Build the query string to filter files from a specific folder
//       print('File Listing');
//       final queryString = "'$folderId' in parents";

//       // List files based on the query
//       final files = await driveApi.files.list(q: queryString);

//       if (files.files != null) {
//         // setState(() {
//         //   _files = files.files!;
//         // });

//         print('Files : ${_files}');
//         // Print file information
//         for (final file in _files) {
//           print('File Name: ${file.name}, ID: ${file.id}');
//         }
//       }
//     } catch (e) {
//       print('Error listing files: $e');
//     }
//   }

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

    // final query = {"limit": 30.toString()};
    // final value = await getResponse(Uri.https(
    //   baseUrl,
    //   basePath + '/songs/random/all',
    //   query,
    // ));
    // if (value.statusCode == 200) {
    //   final body = jsonDecode(value.body);
    //   final songs = (body['results'] as List)
    //       .map((user) => SongModel.fromJson(user))
    //       .toList();

    //   return songs;
    // } else {
    //   throw Exception('Failed to load users');
    // }
  }
}

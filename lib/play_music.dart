import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'google_drive_auth.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayMusic extends StatefulWidget {
  final String trackId;
  final String trackName;
  PlayMusic({required this.trackId, required this.trackName});

  @override
  _PlayMusicPageState createState() => _PlayMusicPageState();
}

class _PlayMusicPageState extends State<PlayMusic> {
  late GoogleDriveAuth _googleDriveAuth;
  late drive.DriveApi _driveApi;
  late AudioPlayer _audioPlayer;
  List<drive.File> _files = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _googleDriveAuth = GoogleDriveAuth();
    _initializeGoogleDriveAuth();
  }

  Future<void> _initializeGoogleDriveAuth() async {
    await _googleDriveAuth.authenticate();
    _driveApi = _googleDriveAuth.getDriveApi();
    print(_driveApi);
    _audioPlayer = AudioPlayer();
    _initAudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _initAudioPlayer() async {
    final fileId = widget.trackId;
    final client = http.Client();
    final driveApi = drive.DriveApi(client);

    try {
      final drive.Media file = await _driveApi.files.get(fileId,
          downloadOptions: drive.DownloadOptions.fullMedia) as drive.Media;

      final dataStore = <int>[];
      file.stream.listen((data) {
        dataStore.addAll(data);
      }, onDone: () {
        Uint8List bytes = Uint8List.fromList(dataStore);

        // Directory tempDir = await getApplicationDocumentsDirectory();

        // final fileName = 'audio_${DateTime.now().millisecondsSinceEpoch}.wav';

        // final tempFilePath = '${tempDir.path}/$fileName';

        // final file = File(tempFilePath);
        // await file.writeAsBytes(bytes);

        // await _audioPlayer.play(file.path, isLocal: true);
        _audioPlayer.play(BytesSource(bytes));

        // file.delete();
      }, onError: (error) {
        print('Error: $error');
      });

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Drive Audio Stream'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {},
                child: Text('Play Audio'),
              ),
      ),
    );
  }
}

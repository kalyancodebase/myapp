import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'google_drive_auth.dart';
import 'play_music.dart';

class AlbumDetailPage extends StatefulWidget {
  final String albumId;
  final String albumName;

  AlbumDetailPage({required this.albumId, required this.albumName});

  @override
  _AlbumDetailPageState createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  late GoogleDriveAuth _googleDriveAuth;
  late drive.DriveApi _driveApi;
  late List<drive.File> _files = [];

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
    _listDriveFiles();
  }

  Future<void> _listDriveFiles() async {
    try {
      final folderId = widget.albumId;
      final queryString = "'$folderId' in parents";
      print('queryString: $queryString');
      final files = await _driveApi.files.list(q: queryString);
      print('Files: ${files.toJson()}');
      if (files.files != null) {
        setState(() {
          _files = files.files!;
        });

        print('Files: $files');
        for (final file in _files) {
          print('File Name: ${file.name}, ID: ${file.id}');
        }
      }
    } catch (e) {
      print('Error listing files: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.albumName}'),
      ),
      body: _buildAlbumItems(),
    );
  }

 Widget _buildAlbumItems() {
    if (_files == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (_files!.isEmpty) {
      return Center(
        child: Text('No files found.'),
      );
    } else {
      return ListView.builder(
        itemCount: _files!.length,
        itemBuilder: (context, index) {
          final file = _files![index];
          return Column(
            children: [
              ListTile(
                title: Text(file.name!),
                // subtitle: Text('File ID: ${file.id}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayMusic(
                        trackId: file.id!,
                        trackName: file.name!,
                      ),
                    ),
                  );
                },
              ),
              Divider(
                height: 1, // Adjust the height of the border
                color: Colors.grey,
              ),
            ],
          );
        },
      );
    }
  }
}

class Item {
  final String trackId;
  final String trackName;

  Item({required this.trackId, required this.trackName});
}
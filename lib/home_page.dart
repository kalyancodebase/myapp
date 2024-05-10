import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'album_details.dart';

final _SCOPES = [
  'https://www.googleapis.com/auth/drive.metadata',
];

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Drive List',
      home: GoogleDriveListPage(),
    );
  }
}

class GoogleDriveListPage extends StatefulWidget {
  @override
  _GoogleDriveListPageState createState() => _GoogleDriveListPageState();
}

class _GoogleDriveListPageState extends State<GoogleDriveListPage> {
  late Future<drive.DriveApi> _driveApiFuture;
  late List<drive.File> _files = [];

  @override
  void initState() {
    super.initState();
     _driveApiFuture = _initializeDriveApi();
  }

  Future<drive.DriveApi> _initializeDriveApi() async {
    try {
        final serviceAccountJson = await _getServiceAccountJson();
        final _credentials = ServiceAccountCredentials.fromJson(serviceAccountJson);
   
      final client = await clientViaServiceAccount(_credentials, _SCOPES);

      final driveApi = drive.DriveApi(client);

      _listFilesFromFolder(driveApi, '1OR0PvEHdCF1nUInsrd1REbpeFByyzZep');

      return driveApi;
    } catch (e) {
      print('Error initializing Drive API: $e');
      rethrow; // Rethrow the exception to propagate it to the FutureBuilder
    }
  }

  Future<Map<String, dynamic>> _getServiceAccountJson() async {
    final jsonString = await rootBundle.loadString('assets/service_account.json');
    return jsonDecode(jsonString);
  }

Future<void> _listFilesFromFolder(
      drive.DriveApi driveApi, String folderId) async {
    try {
      // Build the query string to filter files from a specific folder
      print('File Listing');
      final queryString = "'$folderId' in parents";

      // List files based on the query
      final files = await driveApi.files.list(q: queryString);

      if (files.files != null) {
        setState(() {
          _files = files.files!;
        });

        print('Files : ${_files}');
        // Print file information
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
      body: _buildFileList(),
    );
  }

  Widget _buildFileList() {
    if (_files == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }  else {
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
                  builder: (context) => AlbumDetailPage(
                    albumId: file.id!,
                    albumName: file.name!,
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
  final String albumId;
  final String albumName;

  Item({required this.albumId, required this.albumName});
}

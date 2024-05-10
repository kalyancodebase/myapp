import 'dart:async';
import 'dart:convert';

import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart';
import 'package:flutter/services.dart';

final _SCOPES = [
  'https://www.googleapis.com/auth/drive.metadata',
];

class GoogleDriveAuth {
   late drive.DriveApi _driveApi;

  Future<void> authenticate() async {
    try {
      final credentials = await _getCredentials();
      final client = await clientViaServiceAccount(credentials, [drive.DriveApi.driveScope]);
      _driveApi = drive.DriveApi(client);
    } catch (e) {
      print('Error authenticating with Google Drive: $e');
    }
  }

  Future<ServiceAccountCredentials> _getCredentials() async {
    final credentialsJson = await loadServiceAccountCredentialsJson();
    return ServiceAccountCredentials.fromJson(credentialsJson);
  }

  Future<Map<String, dynamic>> loadServiceAccountCredentialsJson() async {
    final jsonString = await rootBundle.loadString('assets/service_account.json');
    return jsonDecode(jsonString);
  }

   drive.DriveApi getDriveApi() {
    return _driveApi;
  }

}
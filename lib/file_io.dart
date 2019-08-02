
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path; //home/directory/
}

Future<File> get _localFile async {
  final path = await _localPath;

  return new File('$path/data.txt'); //home/directory/data.txt
}

//Write and Read from our file
Future<File> writeData(String message) async {
  final file = await _localFile;

  //write to file
  return file.writeAsString('$message');
}

Future<String> readData() async {
  try {
    final file = await _localFile;

    //Read
    String data = await file.readAsString();

    return data;
  } catch (e) {
    return null;
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:flutter/services.dart'; 
import 'dart:convert';
import 'dart:async';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File access',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFile(title: 'File aceess'),
    );
  }
}

class MyFile extends StatefulWidget {
  MyFile({Key key, this.title}) : super(key: key);

  
  final String title;

  @override
  _MyFileState createState() => _MyFileState();
}

class _MyFileState extends State<MyFile> {

  String _fileNmae;
  String _path;
  String _extension="csv";
  FileType _pickingType;
  File file;
  @override
  void initState() {
    super.initState();
  }
  void _openFileExplorer() async{
  /*  _pickingType=FileType.CUSTOM;
  _path=await FilePicker.getFilePath(
      type: _pickingType, fileExtension: _extension);
      print(_path);   
   */

   file = await FilePicker.getFile(type: FileType.CUSTOM,fileExtension: _extension); 
      String contents = await file.readAsString();
      print(contents);
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
      floatingActionButton: RaisedButton(
        onPressed: ()=>_openFileExplorer(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/*Stream<List<int>> inputStream = file.openRead();
   inputStream
    .transform(utf8.decoder)       // Decode bytes to UTF-8.
    .transform(new LineSplitter()) // Convert stream to individual lines.
    .listen((String line) {        // Process results.
        print('$line: ${line.length} bytes');
      },
      onDone: () { print('File is now closed.'); },
      onError: (e) { print(e.toString()); });*/
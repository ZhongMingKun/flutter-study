import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PathProviderDemo extends StatefulWidget {
  PathProviderDemo({Key key}) : super(key: key);

  @override
  _PathProviderDemoState createState() => new _PathProviderDemoState();
}

class _PathProviderDemoState extends State<PathProviderDemo> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _getLocalFile() async {
    // get the path to the document directory.
    String dir = (await getApplicationDocumentsDirectory()).path;
    new Directory('$dir/test').create(recursive: true);
    new Directory('$dir/test/abc').create(recursive: true);
    File newFile = new File('$dir/test/counter.txt');
    var systemTempDir = Directory('$dir/test');
    print(systemTempDir);
    var dudulu = systemTempDir.listSync(recursive: false, followLinks: false);
    print(dudulu);
    // .listen((FileSystemEntity entity) {
    //   print(entity.path);
    // });
    return newFile;
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // read the variable as a string from the file.
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // write the variable as a string to the file
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Flutter Demo')),
      body: new Center(
        child: new Text('Button tapped $_counter time${
          _counter == 1 ? '' : 's'
        }.'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
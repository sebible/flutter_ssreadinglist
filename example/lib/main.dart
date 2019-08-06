import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_ssreadinglist/flutter_ssreadinglist.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _supported;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool supported;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      supported = await SSReadingList.supportsURL(
          Uri.parse("http://www.thisisgood.com"));
    } on PlatformException {
      print("something is wrong");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _supported = supported;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: FlatButton(
              child: Text(
                  'Safari Reading List is supported: ${_supported}\nTap to add a random url to reading list.'),
              onPressed: () async {
                try {
                  await SSReadingList.addURL(
                      Uri.parse("http://www.something.com"),
                      title: "Random Title", 
                      previewText: "This is a paragraph of random text. So you can get a brief idea of what this url is about",
                      );
                  print("done");
                } catch (err) {
                  print("$err");
                }
              }),
        ),
      ),
    );
  }
}

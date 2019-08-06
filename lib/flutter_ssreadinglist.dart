import 'dart:async';

import 'package:flutter/services.dart';

class SSReadingList {
  static const MethodChannel _channel =
      const MethodChannel('com.sebible.flutter/SSReadingList');

  static Future<bool> supportsURL(Uri url) async {
    if (url == null) {
      return Future.error("url cannot be null");
    }

    final bool ret =
        await _channel.invokeMethod('supportsURL', <String, String>{
      'url': url.toString(),
    });
    return ret;
  }

  static Future<dynamic> addURL(Uri url,
      {String title, String previewText}) async {
    if (url == null) {
      return Future.error("url cannot be null");
    }

    Map<String, dynamic> params = {
      'url': url.toString(),
    };

    if (title != null) {
      params['title'] = title;
    }

    if (previewText != null) {
      params['previewText'] = previewText;
    }

    await _channel.invokeMethod('addReadingListItemWithURL', params);
  }
}

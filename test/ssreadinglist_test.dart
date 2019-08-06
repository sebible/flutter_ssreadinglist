import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ssreadinglist/flutter_ssreadinglist.dart';

void main() {
  const MethodChannel channel = MethodChannel('com.sebible.flutter/SSReadingList');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return true;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('supportsURL', () async {
    expect(await SSReadingList.supportsURL(Uri.parse("http://www.google.com")), true);
  });
}

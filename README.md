# SSReadingList

IOS SSReadingList Api for Flutter. It gives access to SafariServices SSReadingList APIs so Flutter apps can easily add urls to Safari Reading List without having to open links in a Safari view.

## Usage

```dart
import 'package:flutter_ssreadinglist/flutter_ssreadinglist.dart';

myFunction() async {
    try {
      supported = await SSReadingList.supportsURL(
          Uri.parse("http://www.thisisgood.com"));
      await SSReadingList.addURL(
          url: Uri.parse("http://www.thisisgood.com"),
          title: "optional title",
          previewText: "optional text",
      );
    } on PlatformException {
      print("something is wrong");
    }
}
```

Please refer to Apple Documentation about SSReadingList API for more information. [LINK](https://developer.apple.com/documentation/safariservices/ssreadinglist?language=objc)

## Supported Platform

IOS 6+

## License

Apache 2.0

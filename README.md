# SSReadingList

IOS SSReadingList API

## Usage

```dart
import 'package:ssreadinglist/ssreadinglist.dart';

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

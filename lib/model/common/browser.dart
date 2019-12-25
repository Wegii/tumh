import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../data/parser/moodle.dart';

import 'package:requests/requests.dart';

class Browser extends InAppBrowser {
  @override
  void onLoadError(String url, int code, String message) {
    print("\n\nCan't load $url.. Error: $message\n\n");
  }
}

class ChromeBrowser extends ChromeSafariBrowser {
  var moodle;

  ChromeBrowser(browserFallback) : super(bFallback: browserFallback);

  @override
  void onClosed() async {
    moodle = new MoodleAPI();

    print(await moodle.getMoodleSession());

    var r1 = await Requests.post("https://moodle.tum.de/my/",
        json: {"MoodleSession": await moodle.getMoodleSession()});
    //printWrapped(r1.content());
  }

  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}

final ChromeSafariBrowser browser = new ChromeBrowser(new Browser());

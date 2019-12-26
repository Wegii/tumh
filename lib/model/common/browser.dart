import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// Defines the browser object with which allows interaction with the native
/// browser
final ChromeSafariBrowser browser = new ChromeBrowser(new Browser());

/// Fallback browser.
class Browser extends InAppBrowser {
  @override
  void onLoadError(String url, int code, String message) {
    print("\n\nCan't load $url.. Error: $message\n\n");
  }
}

/// Create custom browser that interacts with the native browser.
class ChromeBrowser extends ChromeSafariBrowser {
  ChromeBrowser(browserFallback) : super(bFallback: browserFallback);

  @override
  void onClosed() async {}

  /// Debug method to print long strings.
  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}

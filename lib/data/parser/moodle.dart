import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:async';

/// Defines API to interact with the MOODLE Platform.
class MoodleAPI {
  var moodleSession;
  var cookieManager;

  /// Initialize session.
  MoodleAPI() {
    moodleSession = getMoodleSession();
  }

  /// Initialize moodle session and perform interactions using the shibboleth
  /// protocol.
  ///
  /// Return the moodle session.
  Future getMoodleSession() async {
    var cookieManager = new CookieManager();
    var cookies =
        await cookieManager.getCookies(url: "https://www.moodle.tum.de/my");
  }

  /// Return the users moodle dashboard after authentication is performed.
  Future<String> getMoodleDashboard() async {
    moodleSession =
        (moodleSession == null) ? getMoodleSession() : moodleSession;
  }
}

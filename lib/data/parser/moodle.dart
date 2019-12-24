import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:requests/requests.dart';
import 'dart:async';

import '../../model/common/browser.dart';

class MoodleAPI {
  var moodleSession;
  var cookieManager;
  final Browser browser = new Browser();

  MoodleAPI() {
    moodleSession = getMoodleSession();
  }

  Future getMoodleSession() async {
    var cookieManager = new CookieManager();
    var cookies =
        await cookieManager.getCookies(url: "https://www.moodle.tum.de/my");

    var session;
    for (var cookie in cookies) {
      if (cookie.name == 'MoodleSession') {
        session = cookie.value;
        break;
      }
    }

    return session;
  }

  Future<String> getMoodleDashboard() async {
    // Get session key
    moodleSession =
        (moodleSession == null) ? getMoodleSession() : moodleSession;

    var body = {
      "index": 0,
      "methodname": "core_calendar_get_calendar_monthly_view",
      "args": {
        "year": 2019,
        "month": 12,
        "courseid": 1,
        "categoryid": 0,
        "includenavigation": true,
        "mini": true
      }
    };
    var r1 = await Requests.post(
      "https://www.moodle.tum.de/my/",
      headers: {
        "MoodleSession": "65nveho72o61gnu769cf1rde3n",
        "referer": "https://www.moodle.tum.de/my/"
      },
    );
    return r1.content();
  }
}


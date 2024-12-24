import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

final class InternetConnectivityChecker {
  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult.contains( ConnectivityResult.wifi) ||
        connectivityResult.contains( ConnectivityResult.mobile)||
        connectivityResult.contains( ConnectivityResult.ethernet);
  }
}

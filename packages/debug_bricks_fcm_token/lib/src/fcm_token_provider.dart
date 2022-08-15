import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import 'fcm_token_source.dart';

class FcmTokenProvider extends ChangeNotifier {
  final FcmTokenSource _fcmTokenSource = FcmTokenSource();
  late final StreamSubscription<String> _fcmListener;

  String? get cachedFcmToken {
    return _fcmTokenSource.cachedFcmToken;
  }

  FcmTokenProvider() {
    _loadFcmToken();
    _fcmListener = FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      _loadFcmToken();
    })
      ..onError((err) {});
  }

  @override
  void dispose() {
    super.dispose();
    _fcmListener.cancel();
  }

  _loadFcmToken() async {
    await _fcmTokenSource.fcmTokenFuture;
    notifyListeners();
  }
}

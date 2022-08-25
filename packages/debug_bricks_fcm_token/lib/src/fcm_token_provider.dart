import 'dart:async';

import 'package:flutter/foundation.dart';

import 'fcm_token_source.dart';

class FcmTokenProvider extends ChangeNotifier {
  final FcmTokenSource _fcmTokenSource;
  late final StreamSubscription<String> _fcmListener;

  String? get cachedFcmToken {
    return _fcmTokenSource.cachedFcmToken;
  }

  FcmTokenProvider(this._fcmTokenSource) {
    _loadFcmToken();
    _fcmListener = _fcmTokenSource.onTokenRefresh.listen((fcmToken) {
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

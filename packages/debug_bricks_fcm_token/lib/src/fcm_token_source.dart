import 'package:firebase_messaging/firebase_messaging.dart';

class FcmTokenSource {
  static final FcmTokenSource _instance = FcmTokenSource._internal();
  final FirebaseMessaging _fbMessaging = FirebaseMessaging.instance;
  String? _cachedFcmToken;
  late Future<String?> _fcmTokenFuture;

  String? get cachedFcmToken {
    return _cachedFcmToken;
  }

  Future<String?> get fcmTokenFuture {
    return _fbMessaging.getToken();
  }

  factory FcmTokenSource() => _instance;

  FcmTokenSource._internal() {
    _fcmTokenFuture = fcmTokenFuture;
    _fcmTokenFuture.then((fcmToken) => {_cachedFcmToken = fcmToken});
  }
}

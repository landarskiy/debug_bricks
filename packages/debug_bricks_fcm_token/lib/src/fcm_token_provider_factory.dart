import 'package:debug_bricks_fcm_token/debug_bricks_fcm_token.dart';

class FcmTokenProviderFactory {
  const FcmTokenProviderFactory();

  FcmTokenProvider newInstance() {
    return FcmTokenProvider(FcmTokenSource());
  }
}

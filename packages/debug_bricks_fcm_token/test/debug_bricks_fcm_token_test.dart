import 'package:debug_bricks_fcm_token/debug_bricks_fcm_token.dart';
import 'package:debug_bricks_fcm_token/src/fcm_token_provider_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util/ui_util.dart';

void main() {
  testWidgets('FcmTokenBrick widget test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      FcmTokenBrick(
        title: 'T',
        providerFactory: StubFcmTokenProviderFactory(),
      ),
    );
    expect(find.text('T'), findsOneWidget);
    expect(find.text('TOKEN'), findsOneWidget);
  });
}

class StubFcmTokenProvider extends ChangeNotifier implements FcmTokenProvider {
  @override
  String? get cachedFcmToken => 'TOKEN';
}

class StubFcmTokenProviderFactory implements FcmTokenProviderFactory {
  @override
  FcmTokenProvider newInstance() {
    return StubFcmTokenProvider();
  }
}

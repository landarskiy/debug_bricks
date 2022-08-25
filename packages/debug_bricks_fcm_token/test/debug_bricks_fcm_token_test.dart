import 'dart:async';

import 'package:debug_bricks_fcm_token/debug_bricks_fcm_token.dart';
import 'package:debug_bricks_fcm_token/src/fcm_token_provider_factory.dart';
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

  test('StubFcmTokenSource test', () async {
    final source = StubFcmTokenSource();
    expect(source.cachedFcmToken, 'TOKEN');
    source.onTokenRefresh.listen(expectAsync1((token) {
      expect(token, 'NEW_TOKEN');
    }));
    source.controller.add('NEW_TOKEN');
  });

  test('FcmTokenProvider test', () async {
    final provider = FcmTokenProvider(StubFcmTokenSource());
    expect(provider.cachedFcmToken == 'TOKEN', true);
  });
}

class StubFcmTokenSource implements FcmTokenSource {
  final StreamController<String> controller =
      StreamController<String>.broadcast(sync: true);

  String? _cachedFcmToken;

  StubFcmTokenSource() {
    controller.stream.listen((token) {
      _cachedFcmToken = token;
    });
    controller.add('TOKEN');
  }

  @override
  String? get cachedFcmToken => _cachedFcmToken;

  @override
  Future<String?> get fcmTokenFuture async {
    return 'TOKEN';
  }

  @override
  Stream<String> get onTokenRefresh => controller.stream;
}

class StubFcmTokenProviderFactory implements FcmTokenProviderFactory {
  @override
  FcmTokenProvider newInstance() {
    return FcmTokenProvider(StubFcmTokenSource());
  }
}

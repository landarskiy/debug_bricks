import 'package:debug_bricks_core/debug_bricks_core.dart';
import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'fcm_token_provider.dart';
import 'fcm_token_provider_factory.dart';

class FcmTokenBrick extends StatelessWidget {
  const FcmTokenBrick({
    Key? key,
    this.title = 'FCM token',
    @visibleForTesting this.providerFactory = const FcmTokenProviderFactory(),
  }) : super(key: key);

  final String title;
  final FcmTokenProviderFactory providerFactory;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FcmTokenProvider>(
      create: (_) => providerFactory.newInstance(),
      builder: (context, _) {
        final provider = context.watch<FcmTokenProvider>();
        final token = provider.cachedFcmToken ?? 'UNKNOWN';
        return TextBrick(
          infoIconData: Icons.cloud,
          actionIconData: Icons.copy,
          title: title,
          subtitle: token,
          onTap: () {
            Clipboard.setData(ClipboardData(text: token));
            BricksLogger().debug(token);
          },
        );
      },
    );
  }
}

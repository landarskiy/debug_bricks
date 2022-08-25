import 'package:debug_bricks_theme_info/debug_bricks_theme_info.dart';
import 'package:debug_bricks_theme_info/src/color_extension.dart';
import 'package:debug_bricks_theme_info/src/rounded_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util/ui_util.dart';

void main() {
  test('int Extension test', () {
    expect(0.hexString(), '00');
    expect(1.hexString(), '01');
    expect(16.hexString(), '10');
    expect(255.hexString(), 'FF');
  });

  test('HexColorFormatter test', () {
    const adaptive = HexColorFormatter(mode: HexColorFormatterMode.adaptive);
    expect(adaptive.format(Colors.white), '#FFFFFF');
    expect(adaptive.format(Colors.white.withAlpha(0)), '#00FFFFFF');
    expect(adaptive.format(Colors.white.withAlpha(128)), '#80FFFFFF');

    const rgb = HexColorFormatter(mode: HexColorFormatterMode.rgb);
    expect(rgb.format(Colors.white), '#FFFFFF');
    expect(rgb.format(Colors.white.withAlpha(0)), '#FFFFFF');
    expect(rgb.format(Colors.white.withAlpha(128)), '#FFFFFF');

    const argb = HexColorFormatter(mode: HexColorFormatterMode.argb);
    expect(argb.format(Colors.white), '#FFFFFFFF');
    expect(argb.format(Colors.white.withAlpha(0)), '#00FFFFFF');
    expect(argb.format(Colors.white.withAlpha(128)), '#80FFFFFF');
  });

  test('Color Extension test', () {
    expect(Colors.white.format(adaptiveHexColorFormatter), '#FFFFFF');
  });

  testWidgets('ExpandedColorInfoBrick widget test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      ExpandedColorInfoBrick(
        colorInfo: ColorInfo('N', Colors.white, Colors.red),
      ),
    );
    expect(find.text('N'), findsOneWidget);
    expect(find.text('#FFFFFF'), findsOneWidget);
  });

  testWidgets('ThemeColorInfoBrick widget test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      const SingleChildScrollView(child: ThemeColorInfoBrick()),
    );
    expect(find.byType(RoundedLabel), findsNWidgets(6));

    expect(find.text('Primary'), findsNWidgets(2));
    expect(find.text('On Primary'), findsOneWidget);
    expect(find.text('Primary Container'), findsOneWidget);
    expect(find.text('On Primary Container'), findsOneWidget);

    expect(find.text('Secondary'), findsNWidgets(2));
    expect(find.text('On Secondary'), findsOneWidget);
    expect(find.text('Secondary Container'), findsOneWidget);
    expect(find.text('On Secondary Container'), findsOneWidget);

    expect(find.text('Tertiary'), findsNWidgets(2));
    expect(find.text('On Tertiary'), findsOneWidget);
    expect(find.text('Tertiary Container'), findsOneWidget);
    expect(find.text('On Tertiary Container'), findsOneWidget);

    expect(find.text('Error'), findsNWidgets(2));
    expect(find.text('On Error'), findsOneWidget);
    expect(find.text('Error Container'), findsOneWidget);
    expect(find.text('On Error Container'), findsOneWidget);

    expect(find.text('Background'), findsOneWidget);
    expect(find.text('On Background'), findsOneWidget);
    expect(find.text('Surface'), findsOneWidget);
    expect(find.text('On Surface'), findsOneWidget);

    expect(find.text('Surface Variant'), findsOneWidget);
    expect(find.text('On Surface Variant'), findsOneWidget);
    expect(find.text('Outline'), findsNWidgets(2));
  });
}

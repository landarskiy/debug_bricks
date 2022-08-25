![LOGO](https://github.com/touchlane/debug_bricks/raw/master/doc/media/logo.svg)

[![codecov](https://codecov.io/gh/touchlane/debug_bricks/branch/master/graph/badge.svg?token=MIUHAFNRPI)](https://codecov.io/gh/touchlane/debug_bricks)

Set of UI components for debug screens.

# Components

## Device Info

Functional UI component that provides information about device.

![DeviceInfoBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_device_info/doc/media/device_info_light.png)

![DeviceInfoBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_device_info/doc/media/device_info_dark.png)

### Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✔️    | ✔️  |  ✔️   | ✔️  |  ✔️   |   ✔️    |

### Integration

[Integration guide](packages/debug_bricks_device_info/README.md)

[Source code](packages/debug_bricks_device_info)

## FCM Token

Functional UI component that displays FCM token.

![FcmTokenBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_fcm_token/doc/media/fcm_token_light.png)

![FcmTokenBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_fcm_token/doc/media/fcm_token_dark.png)

### Platform Support

| Android | iOS | MacOS | Web |
| :-----: | :-: | :---: | :-: |
|   ✔️    | ✔️  |  ✔️   | ✔️  |

### Integration

[Integration guide](packages/debug_bricks_fcm_token/README.md)

[Source code](packages/debug_bricks_fcm_token)

## Easy Localization

Functional UI component that provides possibility to change app locale.
Under the hood work with [easy_localization](https://pub.dev/packages/easy_localization)
package. Also you can display table with all trnslations.

![EasyLocalizationBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_easy_localization/doc/media/language_control_light.png)

![EasyLocalizationBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_easy_localization/doc/media/language_control_dark.png)

![LocalizationsTable](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_easy_localization/doc/media/language_keys.png)

### Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✔️    | ✔️  |  ✔️   | ✔️  |  ✔️   |   ✔️    |

### Integration

[Integration guide](packages/debug_bricks_easy_localization/README.md)

[Source code](packages/debug_bricks_easy_localization)

## UI

Set of non-functional UI components with predefined style. Almost all 
components are based on bundled [ListTile](https://api.flutter.dev/flutter/material/ListTile-class.html)
component and just make a little simplification for internal usage purposes. 
Normally it's not necessary to use it on your debug screens but of course you 
always can if you feel that this small simplification meets your requirements.

![UI Components](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_ui/doc/media/all_dark_light.png)

### Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✔️    | ✔️  |  ✔️   | ✔️  |  ✔️   |   ✔️    |

### Integration

[Integration guide](packages/debug_bricks_ui/README.md)

[Source code](packages/debug_bricks_ui)

## Theme Info

Non-functional UI component that provides possibility to see all Material Theme 3 colors.

![ThemeColorInfoBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_theme_info/doc/media/theme_color_info.png)

### Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✔️    | ✔️  |  ✔️   | ✔️  |  ✔️   |   ✔️    |

### Integration

[Integration guide](packages/debug_bricks_theme_info/README.md)

[Source code](packages/debug_bricks_theme_info)

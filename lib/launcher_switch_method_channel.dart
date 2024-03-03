import 'package:flutter/services.dart' show MethodChannel;
import 'package:flutter/widgets.dart';

import 'launcher_switch_platform_interface.dart';

/// An implementation of [LauncherSwitchPlatform] that uses method channels.
class MethodChannelLauncherSwitch extends LauncherSwitchPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('launcher_switch');

  @override
  Future<void> switchIcon({
    required String iconKey,
    required String previousIconKey,
  }) async {
    return await methodChannel.invokeMethod(
      "switch_icon",
      [iconKey, previousIconKey],
    );
  }
}

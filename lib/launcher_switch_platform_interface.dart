import 'package:plugin_platform_interface/plugin_platform_interface.dart'
    show PlatformInterface;

import 'launcher_switch_method_channel.dart';

abstract class LauncherSwitchPlatform extends PlatformInterface {
  /// Constructs a LauncherSwitchPlatform.
  LauncherSwitchPlatform() : super(token: _token);

  static final Object _token = Object();

  static LauncherSwitchPlatform _instance = MethodChannelLauncherSwitch();

  /// The default instance of [LauncherSwitchPlatform] to use.
  ///
  /// Defaults to [MethodChannelLauncherSwitch].
  static LauncherSwitchPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LauncherSwitchPlatform] when
  /// they register themselves.
  static set instance(LauncherSwitchPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> switchIcon({
    required String iconKey,
    required String previousIconKey,
  });
}

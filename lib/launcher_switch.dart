import 'launcher_switch_platform_interface.dart';

class LauncherSwitch {
  /// This function will enable you to change your default launcher icon to
  /// another icon. The various keys are are the `[android:name]` of the activity tag
  /// or activity-alias tag
  /// ```
  /// example
  /// LauncherSwitch().switchIcon(
  /// iconKey: ".Icon2",
  /// previousIconKey: ".MainActivity",
  /// )
  /// ```
  Future<void> switchIcon({
    required String iconKey,
    required String previousIconKey,
  }) async {
    return await LauncherSwitchPlatform.instance.switchIcon(
      iconKey: iconKey,
      previousIconKey: previousIconKey,
    );
  }
}

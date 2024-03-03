import 'package:flutter_test/flutter_test.dart';
import 'package:launcher_switch/launcher_switch_platform_interface.dart';
import 'package:launcher_switch/launcher_switch_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLauncherSwitchPlatform
    with MockPlatformInterfaceMixin
    implements LauncherSwitchPlatform {
  @override
  Future<void> switchIcon(
      {required String iconKey, required String previousIconKey}) {
    throw UnimplementedError();
  }
}

void main() {
  final LauncherSwitchPlatform initialPlatform =
      LauncherSwitchPlatform.instance;

  test('$MethodChannelLauncherSwitch is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLauncherSwitch>());
  });
}

import 'package:battery_meter_plugin/battery_meter_plugin.dart';
import 'package:battery_meter_plugin/battery_meter_plugin_method_channel.dart';
import 'package:battery_meter_plugin/battery_meter_plugin_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBatteryMeterPluginPlatform
    with MockPlatformInterfaceMixin
    implements BatteryMeterPluginPlatform {
  @override
  Future<num?> getBatteryLevel() => Future.value(42);
}

void main() {
  final BatteryMeterPluginPlatform initialPlatform =
      BatteryMeterPluginPlatform.instance;

  test('$MethodChannelBatteryMeterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBatteryMeterPlugin>());
  });

  test('getBatteryLevel', () async {
    BatteryMeterPlugin batteryMeterPlugin = BatteryMeterPlugin();
    MockBatteryMeterPluginPlatform fakePlatform =
        MockBatteryMeterPluginPlatform();
    BatteryMeterPluginPlatform.instance = fakePlatform;

    expect(await batteryMeterPlugin.getBatteryLevel(), '42');
  });
}

import 'battery_meter_plugin_platform_interface.dart';

class BatteryMeterPlugin {
  /// Returns the battery level as a string.
  Future<num?> getBatteryLevel() {
    return BatteryMeterPluginPlatform.instance.getBatteryLevel();
  }
}

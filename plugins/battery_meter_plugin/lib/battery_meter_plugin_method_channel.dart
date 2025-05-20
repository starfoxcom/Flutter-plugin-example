import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'battery_meter_plugin_platform_interface.dart';

/// An implementation of [BatteryMeterPluginPlatform] that uses method channels.
class MethodChannelBatteryMeterPlugin extends BatteryMeterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('battery_meter_plugin');

  /// Returns the battery level as a string.
  @override
  Future<num?> getBatteryLevel() async {
    final batteryLevel = await methodChannel.invokeMethod<num?>(
      'getBatteryLevel',
    );
    return batteryLevel;
  }
}

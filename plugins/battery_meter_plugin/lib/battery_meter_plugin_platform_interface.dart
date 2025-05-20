import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'battery_meter_plugin_method_channel.dart';

abstract class BatteryMeterPluginPlatform extends PlatformInterface {
  /// Constructs a BatteryMeterPluginPlatform.
  BatteryMeterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static BatteryMeterPluginPlatform _instance =
      MethodChannelBatteryMeterPlugin();

  /// The default instance of [BatteryMeterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelBatteryMeterPlugin].
  static BatteryMeterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BatteryMeterPluginPlatform] when
  /// they register themselves.
  static set instance(BatteryMeterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns the battery level as a string.
  Future<num?> getBatteryLevel() {
    throw UnimplementedError('getBatteryLevel() has not been implemented.');
  }
}

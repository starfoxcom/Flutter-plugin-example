import 'package:battery_meter_plugin/battery_meter_plugin_method_channel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelBatteryMeterPlugin platform = MethodChannelBatteryMeterPlugin();
  const MethodChannel channel = MethodChannel('battery_meter_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          if (methodCall.method == 'getBatteryLevel') {
            return '42';
          }

          throw PlatformException(
            code: 'Unimplemented',
            details:
                'battery_meter_plugin for web doesn\'t implement \'${methodCall.method}\'',
          );
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getBatteryLevel', () async {
    expect(await platform.getBatteryLevel(), '42');
  });
}

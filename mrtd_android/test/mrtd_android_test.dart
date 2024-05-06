// import 'package:flutter_test/flutter_test.dart';
// import 'package:mrtd_android/mrtd_android.dart';
// import 'package:mrtd_android/mrtd_android_platform_interface.dart';
// import 'package:mrtd_android/mrtd_android_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockMrtdAndroidPlatform
//     with MockPlatformInterfaceMixin
//     implements MrtdAndroidPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final MrtdAndroidPlatform initialPlatform = MrtdAndroidPlatform.instance;

//   test('$MethodChannelMrtdAndroid is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelMrtdAndroid>());
//   });

//   test('getPlatformVersion', () async {
//     MrtdAndroid mrtdAndroidPlugin = MrtdAndroid();
//     MockMrtdAndroidPlatform fakePlatform = MockMrtdAndroidPlatform();
//     MrtdAndroidPlatform.instance = fakePlatform;

//     expect(await mrtdAndroidPlugin.getPlatformVersion(), '42');
//   });
// }

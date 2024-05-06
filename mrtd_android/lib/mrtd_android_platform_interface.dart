import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mrtd_android_method_channel.dart';

abstract class MrtdAndroidPlatform extends PlatformInterface {
  /// Constructs a MrtdAndroidPlatform.
  MrtdAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static MrtdAndroidPlatform _instance = MethodChannelMrtdAndroid();

  /// The default instance of [MrtdAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelMrtdAndroid].
  static MrtdAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MrtdAndroidPlatform] when
  /// they register themselves.
  static set instance(MrtdAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> readIdCard({
    required String docId,
    required String dateOfBirth,
    required String dateOfExpired,
  }) {
    throw UnimplementedError('readIdCard() has not been implemented.');
  }
}

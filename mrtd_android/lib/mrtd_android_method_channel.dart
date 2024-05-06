import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mrtd_android_platform_interface.dart';

/// An implementation of [MrtdAndroidPlatform] that uses method channels.
class MethodChannelMrtdAndroid extends MrtdAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mrtd_android');

  @override
  Future<String?> readIdCard({
    required String docId,
    required String dateOfBirth,
    required String dateOfExpired,
  }) async {
    final response = await methodChannel.invokeMethod<String>(
        'readIdCard', <String, String>{
      'docId': docId,
      'dateOfBirth': dateOfBirth,
      'dateOfExpired': dateOfExpired
    });
    return response;
  }
}

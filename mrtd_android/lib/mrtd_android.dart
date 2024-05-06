import 'mrtd_android_platform_interface.dart';

class MrtdAndroid {
  Future<String?> readIdCard({
    required String docId,
    required String dateOfBirth,
    required String dateOfExpired,
  }) async {
    try {
      final result = MrtdAndroidPlatform.instance.readIdCard(
        dateOfBirth: dateOfBirth,
        docId: docId,
        dateOfExpired: dateOfExpired,
      );
      return result;
    } catch (e) {
      return null;
    }
  }
}

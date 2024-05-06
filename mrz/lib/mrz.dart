library mrz;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path_provider/path_provider.dart';

class BacKey {
  final String id;
  final DateTime dateOfBirth;
  final DateTime dateOfExpiry;
  BacKey({
    required this.id,
    required this.dateOfBirth,
    required this.dateOfExpiry,
  });
}

class MrzReader {
  MrzReader._internal();

  static final MrzReader _instance = MrzReader._internal();

  static MrzReader get instance {
    return _instance;
  }

  Future<BacKey?> fromBytes(Uint8List bytesData) async {
    try {
      TextRecognizer? textRecognizer;
      try {
        textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
        final dir = await getApplicationCacheDirectory();
        final pathOfFile = '${dir.path}/ocr_mrz_catching_plugin.jpg';
        final file = await File(pathOfFile).create(recursive: true);
        await file.writeAsBytes(bytesData);

        final inputImage = InputImage.fromFile(file);
        final textData = await textRecognizer.processImage(inputImage);
        final text = textData.text.replaceAll(' ', '').replaceAll('\n', '');
        int vnmIndex = text.indexOf("VNM");
        String resultMRZString = '';
        if (vnmIndex != -1) {
          resultMRZString = text.substring(vnmIndex);
          resultMRZString = resultMRZString.replaceFirst('VNM', '');
          resultMRZString = resultMRZString
              .replaceAll(
                  resultMRZString.substring(resultMRZString.indexOf("VNM")), '')
              .replaceAll('O', '0');
        }
        if (resultMRZString.length != 40) {
          throw Exception('Wrong length MRZ');
        }
        final documentId = resultMRZString.substring(0, 9);
        final checkPointID = resultMRZString.substring(9, 10);
        final dateOfBirth = resultMRZString.substring(25, 25 + 6);
        final checkPointDateOfBirth = resultMRZString.substring(25 + 6, 25 + 7);
        final dateOfExpiry = resultMRZString.substring(33, 33 + 6);
        final checkPointDateOfExpiry =
            resultMRZString.substring(33 + 6, 33 + 7);
        final checkBirth = calculateWeightedSum(dateOfBirth) % 10 ==
            int.tryParse(checkPointDateOfBirth);
        final checkExpiration = calculateWeightedSum(dateOfExpiry) % 10 ==
            int.tryParse(checkPointDateOfExpiry);
        final checkDocId =
            calculateWeightedSum(documentId) % 10 == int.tryParse(checkPointID);
        final passed = checkDocId && checkBirth && checkExpiration;
        if (passed) {
          final date1 = _parseDateFromYYMMDDString(dateOfBirth);
          final date2 = _parseDateFromYYMMDDString(dateOfExpiry);
          debugPrint('CJECL $documentId $date1 $date2');
          return BacKey(
              id: documentId, dateOfBirth: date1, dateOfExpiry: date2);
        }

        await file.delete(recursive: true);
      } catch (e, t) {
        debugPrint('$e $t');
      }
      await textRecognizer?.close();
      return null;
    } catch (e) {
      return null;
    }
  }

  static DateTime _parseDateFromYYMMDDString(String dateString) {
    if (dateString.length != 6) {
      throw ArgumentError("Invalid date string length");
    }

    int year =
        int.parse(dateString.substring(0, 2)) + 2000; // Assuming 20YY format
    if (year > 2030) {
      year =
          int.parse(dateString.substring(0, 2)) + 1900; // Assuming 19YY format
    }
    int month = int.parse(dateString.substring(2, 4));
    int day = int.parse(dateString.substring(4, 6));

    return DateTime(year, month, day);
  }

  static int calculateWeightedSum(String input,
      [List<int> weights = const [7, 3, 1]]) {
    int sum = 0;
    int weightPosition = 0;
    for (int i = 0; i < input.length; i++) {
      int digit = int.parse(input[i]);
      sum += digit * weights[weightPosition];
      if (weightPosition == weights.length - 1) {
        weightPosition = 0;
      } else {
        weightPosition++;
      }
    }

    return sum;
  }
}

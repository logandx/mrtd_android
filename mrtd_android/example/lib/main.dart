import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:mrtd_android/mrtd_android.dart';
import 'package:mrtd_android_example/citizen.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final captureKey = GlobalKey();

  @override
  void initState() {
    _initCamera();
    super.initState();
  }

  Future<void> _initCamera() async {
    // final listCameras = await availableCameras();
    // if (listCameras.isNotEmpty) {
    //   cameraController = CameraController(
    //       listCameras.first, ResolutionPreset.medium,
    //       enableAudio: false);
    //   await cameraController?.initialize();
    //   setState(() {});
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Chụp mặt sau CCCD và đọc thông tin',
          style: TextStyle(color: Colors.white, fontSize: 48),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      // body: Center(
      //   child: cameraController != null
      //       ? RepaintBoundary(
      //           key: captureKey,
      //           child: Transform.scale(
      //               scaleX: 0.64, child: CameraPreview(cameraController!)),
      //         )
      //       : const SizedBox.shrink(),
      // ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () async {
                  // final lightRequestResult =
                  //     await MrtdAndroid().turnOnTheLight();
                  // log(lightRequestResult.toString(), name: 'LOG_LIGHT');
                  // return;
                  // final boundary = captureKey.currentContext?.findRenderObject()
                  //     as RenderRepaintBoundary;
                  // ui.Image image = await boundary.toImage();

                  // final byteData =
                  //     await image.toByteData(format: ui.ImageByteFormat.png);
                  // final pngBytes = byteData?.buffer.asUint8List();
                  // if (pngBytes == null) {
                  //   return;
                  // }

                  await MrtdAndroid()
                      .readIdCard(
                          dateOfBirth: "990928",
                          dateOfExpired: "240928",
                          docId: "064200005816")
                      .then((value) {
                    try {
                      final citizen = Citizen.fromJson(value ?? '{}');
                      final Map<String, dynamic> jsonData =
                          jsonDecode(value ?? '{}');
                      final faceData = (jsonData['photoBase64'] as String?)
                          ?.replaceAll('\n', '');

                      final face = base64Decode(faceData ?? "");
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              scrollable: true,
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.memory(
                                    face,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Text('No image');
                                    },
                                  ),
                                  Text(
                                    'Họ và tên: ${citizen.fullName}'.hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Ngày sinh: ${citizen.birthDate}'.hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Số CCCD: ${citizen.citizenPid}'.hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Ngày cấp: ${citizen.dateProvide}'.hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Dân tộc: ${citizen.ethnic}'.hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Họ và tên cha: ${citizen.fatherName}'
                                        .hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Giới tính: ${citizen.gender}'.hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Quê quán: ${citizen.homeTown}'.hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Đặc điểm nhận dạng: ${citizen.identifyCharacteristics}'
                                        .hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Họ và tên mẹ: ${citizen.motherName}'
                                        .hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Quốc tịch: ${citizen.nationality}'.hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Số định danh cũ: ${citizen.oldIdentify}'
                                        .hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Ngày hết hạn: ${citizen.outOfDate}'.hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Tôn giáo: ${citizen.religion}'.hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Thường trú: ${citizen.regPlaceAddress}'
                                        .hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'PEM: ${citizen.sodBase64}'.hide(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            );
                          });
                    } catch (e) {
                      log(e.toString());
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              scrollable: true,
                              content: Column(
                                children: [
                                  Text(
                                    'ERROR: $value',
                                    style: const TextStyle(fontSize: 48),
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                  });
                },
                child: const Text(
                  'Đọc thông tin',
                  style: TextStyle(fontSize: 68, color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}

extension StringEx on String {
  String hide() {
    return this;
    final hideLength = length / 2;
    return replaceRange(hideLength.toInt(), length, '*');
  }
}

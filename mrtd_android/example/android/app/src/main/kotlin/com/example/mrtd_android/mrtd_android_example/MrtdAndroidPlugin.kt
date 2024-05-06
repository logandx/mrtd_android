package com.example.mrtd_android.mrtd_android_example

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class MrtdAndroidPlugin:  FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private var usbHelp: UsbDeviceHelper? = null
    private lateinit var context: Context
    private var cameraHelper: CameraHelper = CameraHelper()
    private var mCameraHelperWeak: WeakReference<ICameraHelper>? = null
}

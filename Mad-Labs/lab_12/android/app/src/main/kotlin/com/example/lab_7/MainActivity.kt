package com.example.nativefeatures

import android.content.Context
import android.os.Build
import android.os.VibrationEffect
import android.os.Vibrator
import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "native.features.channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            
            when (call.method) {
                "getDeviceInfo" -> {
                    val deviceInfo = getDeviceInfo()
                    result.success(deviceInfo)
                }
                "getBatteryLevel" -> {
                    val batteryLevel = getBatteryLevel()
                    result.success(batteryLevel)
                }
                "vibrate" -> {
                    vibrateDevice()
                    result.success("Vibrated")
                }
                "showToast" -> {
                    val message = call.argument<String>("message")
                    showNativeToast(message ?: "Hello from Native!")
                    result.success("Toast shown")
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun getDeviceInfo(): String {
        return """
            Device: ${Build.DEVICE}
            Manufacturer: ${Build.MANUFACTURER}
            Model: ${Build.MODEL}
            Product: ${Build.PRODUCT}
            Version: ${Build.VERSION.RELEASE}
            SDK: ${Build.VERSION.SDK_INT}
        """.trimIndent()
    }

    private fun getBatteryLevel(): String {
        // Note: Actual battery level requires more complex implementation
        return "Battery level feature would be implemented here"
    }

    private fun vibrateDevice() {
        val vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        if (vibrator.hasVibrator()) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                vibrator.vibrate(VibrationEffect.createOneShot(500, VibrationEffect.DEFAULT_AMPLITUDE))
            } else {
                vibrator.vibrate(500)
            }
        }
    }

    private fun showNativeToast(message: String) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
    }
}
package com.kaher.unesco1


import android.view.ContextThemeWrapper
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

class MainActivity: FlutterActivity()  {
    private  var CHANNEL="samples.flutter.dev/battery"


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val channel =  MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)








            }
        }




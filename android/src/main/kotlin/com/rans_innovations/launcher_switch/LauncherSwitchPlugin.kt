package com.rans_innovations.launcher_switch

import android.app.Activity
import android.content.ComponentName
import android.content.Context
import android.content.pm.PackageManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** LauncherSwitchPlugin */
class LauncherSwitchPlugin : FlutterPlugin, MethodCallHandler, Activity() {
    private lateinit var channel: MethodChannel
    private lateinit var appContext: Context
    private lateinit var packManager: PackageManager


    private fun switchIcon(iconKey: String, previousIconKey: String) {
        val packName = appContext.packageName

        packManager.let {
            it.setComponentEnabledSetting(
                ComponentName(
                    appContext,
                    "$packName$previousIconKey"
                ),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP
            )

            it.setComponentEnabledSetting(
                ComponentName(
                    appContext,
                    "$packName$iconKey"
                ),
                PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                PackageManager.DONT_KILL_APP
            )

        }
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "launcher_switch")
        appContext = flutterPluginBinding.applicationContext
        appContext.packageManager?.let {
            packManager = it
        }
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "switch_icon" -> {
                val keys = call.arguments as List<*>
                val iconKey = keys[0] as String
                val previousIconKey = keys[1] as String
                switchIcon(
                    iconKey,
                    previousIconKey
                )
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}

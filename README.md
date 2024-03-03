# launcher_switch

This is a flutter package that will enable you switch between different laucher icon during in during runtime.

### Getting Started

Add `launcher_switch` as a dependency in your pubspec.yaml file

```
dependencies:
    launcher_switch: ^<latest-version>
```

#### Permission required

No permission required

## Configuration
First, add various icons as `activity-alias` tags below the activity tag in your AndroidManifest.xml file. For example:
```
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <application
        android:label="{YOUR_APPLICATION_NAME}"
        android:name="${applicationName}"
        <!-- This is your default icon -->
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>

        <!-- Add your activity-alias like this -->
        <activity-alias
            <!-- the name in this case in .Icon2   -->
            android:name=".Icon2"
            android:exported="true"
            android:enabled="false"
            android:hardwareAccelerated="true"
            android:icon="@mipmap/ic_launcher_2"
            android:targetActivity=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity-alias>

        <!-- Add more activity-alias tags according to the number of launcher-icons you have -->

        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
</manifest>
```

Things you will have to note

- The android:icon of the application tag is the default icon
- All activity-alias tags must point to `MainActivity` using android:targetActivity: ".MainActivity".
- Set `android:enabled` to false for all added activity-alias tags.
- The Android OS doesn't store the current activity/alias name, so consider saving it using `[SharedPreferences]` or another persistent storage to avoid issues.
- Always make sure icon keys are defined in your manifest file
- Make sure the android:icon is created in your res/minmap directory for each alias(in this case, the second launcher was @minmap/ic_launcher_2)
- The name of the various activity-alias must start with a dot( eg, .Icon2, .IconAlias, .SecondActivity, etc)

## Usage

1. Import and create an instance of launcher_switch

```
import 'package:launcher_switch/launcher_switch.dart';

final switcher = LauncherSwitch();
```

2. You can change your icon by calling the switchIcon function. Assuming you just installed the app, the previousIconKey parameter would be ".MainActivity", and the iconKey parameter would be android:name of any of your alias in your AndroidManifest.xml( in this case, it would be ".Icon2")

```
switcher.switchIcon(
    iconKey: ".Icon2",
    previousIconKey: ".MainActivity",
)
```
So, if you would want to the icon again, the previous icon would now be ".Icon2", then you set the new icon using the name property of the alias.
If you would like change to your main icon, you can do something like
```
switcher.switchIcon(
    previousIconKey: ".Icon2",//this will be different in your case
    iconKey: ".MainActivity",
)
```

## IMPORTANT

This app will close after executing this function to refresh the icon so make sure all data is saved well before calling this function

## Contributions and Support
- All contributions and issues are welcomed.
- Contact me at ransfordowusuansah9@gmail.com.
- If you want to contribute code, please create a pull request.
- If you find a bug or want a feature, please fill an issue.

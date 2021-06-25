# screen_recording_box

A flutter plugin allowing you to record your screen

## Android integration

Android needs the following permissions

```xml
  <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
  <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
  <uses-permission android:name="android.permission.WRITE_INTERNAL_STORAGE" />
  <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
  <uses-permission android:name="android.permission.RECORD_AUDIO" />
```

## iOS integration

Does not work yet - will be implemented shortly

## Usage

```dart
// Start recording (return a bool telling if screen recording has started or not)
bool result = await ScreenRecorderBox.startRecording('screen_recording_name');

// Stop recording (returns the screen recording path)
String result = await ScreenRecorderBox.stopRecording();

// Pause recording (returns a bool telling if recording has been paused or not)
bool result = await ScreenRecorderBox.pauseRecording();

// Resume recording (returns a bool telling if recording has resumed or not)
bool result = await ScreenRecorderBox.resumeRecording();

// Find out if screen is being recorded right now (it returns false on paused recording)
bool isRecording = ScreenRecorderBox.isRecording;

// Find out if recording has been started (returns true if recording not stopped)
bool hasBeenStarted = ScreenRecorderBox.hasBeenStarted;
```

## Questions?

Please look at and try the example - its pretty straight forward 🦖

# screen_recorder_box

A flutter plugin allowing you to record your screen

## Android integration

### Optional configuration:

- **Configure maximum number of concurrent tasks:** the plugin depends on `WorkManager` library and `WorkManager` depends on the number of available processor to configure the maximum number of tasks running at a moment. You can setup a fixed number for this configuration by adding following codes to your `AndroidManifest.xml`:

```xml
 <provider
     android:name="androidx.work.impl.WorkManagerInitializer"
     android:authorities="${applicationId}.workmanager-init"
     android:enabled="false"
     android:exported="false" />

 <provider
     android:name="com.bluechilli.flutteruploader.FlutterUploaderInitializer"
     android:authorities="${applicationId}.flutter-upload-init"
     android:exported="false">
     <!-- changes this number to configure the maximum number of concurrent tasks -->
     <meta-data
         android:name="com.bluechilli.flutterupload.MAX_CONCURRENT_TASKS"
         android:value="3" />

     <!-- changes this number to configure connection timeout for the upload http request -->
     <meta-data android:name="com.bluechilli.flutteruploader.UPLOAD_CONNECTION_TIMEOUT_IN_SECONDS" android:value="3600" />
 </provider>
```



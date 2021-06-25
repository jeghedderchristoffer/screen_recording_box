#import "ScreenRecorderBoxPlugin.h"
#if __has_include(<screen_recorder_box/screen_recorder_box-Swift.h>)
#import <screen_recorder_box/screen_recorder_box-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "screen_recorder_box-Swift.h"
#endif

@implementation ScreenRecorderBoxPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftScreenRecorderBoxPlugin registerWithRegistrar:registrar];
}
@end

#import "ShrinkSidemenuPlugin.h"
#if __has_include(<shrink_sidemenu/shrink_sidemenu-Swift.h>)
#import <shrink_sidemenu/shrink_sidemenu-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "shrink_sidemenu-Swift.h"
#endif

@implementation ShrinkSidemenuPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftShrinkSidemenuPlugin registerWithRegistrar:registrar];
}
@end

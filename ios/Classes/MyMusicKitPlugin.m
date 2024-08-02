#import "MyMusicKitPlugin.h"
#if __has_include(<my_music_kit_plugin/my_music_kit_plugin-Swift.h>)
#import <my_music_kit_plugin/my_music_kit_plugin-Swift.h>
#else
#import "my_music_kit_plugin-Swift.h"
#endif

@implementation MyMusicKitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [SwiftMyMusicKitPlugin registerWithRegistrar:registrar];
}
@end

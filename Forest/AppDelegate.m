#import "AppDelegate.h"
#import "FXColors.h"
#import "MainTabBarController.h"
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = FXBackgroundColor();
    self.window.rootViewController = [[MainTabBarController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}
@end

#import "MainTabBarController.h"
#import "FXColors.h"
#import "HomeViewController.h"
#import "SourcesViewController.h"
#import "SearchViewController.h"
#import "InstalledViewController.h"
#import "ChangesViewController.h"
@implementation MainTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = FXBackgroundColor();
    self.tabBar.tintColor = [UIColor colorWithRed:0.19 green:0.48 blue:0.31 alpha:1.0];
    self.viewControllers = @[
        [self nav:[[HomeViewController alloc] init] title:@"Home" icon:@"house.fill"],
        [self nav:[[SourcesViewController alloc] init] title:@"Sources" icon:@"shippingbox.fill"],
        [self nav:[[SearchViewController alloc] init] title:@"Search" icon:@"magnifyingglass"],
        [self nav:[[InstalledViewController alloc] init] title:@"Installed" icon:@"checkmark.circle.fill"],
        [self nav:[[ChangesViewController alloc] init] title:@"Changes" icon:@"arrow.clockwise"]
    ];
}
- (UINavigationController *)nav:(UIViewController *)vc title:(NSString *)title icon:(NSString *)icon {
    vc.title = title;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    if (@available(iOS 13.0, *)) nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage systemImageNamed:icon] selectedImage:nil];
    else nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:nil selectedImage:nil];
    return nav;
}
@end

#import "InstalledViewController.h"
@implementation InstalledViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self showEmptyStateWithTitle:@"Installed packages" message:@"Installed package discovery will appear here when Forest is connected to the device's dpkg status database."];
}
@end

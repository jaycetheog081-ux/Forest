#import "ChangesViewController.h"
@implementation ChangesViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self showEmptyStateWithTitle:@"You're all caught up" message:@"Available upgrades and package history will appear here after APT indexes and dpkg status are connected."];
}
@end

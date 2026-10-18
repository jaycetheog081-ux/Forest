#import "SearchViewController.h"
#import "FXColors.h"
@interface SearchViewController () <UISearchBarDelegate>
@property (nonatomic, strong) UILabel *statusLabel;
@end
@implementation SearchViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UISearchBar *searchBar = [[UISearchBar alloc] init]; searchBar.placeholder = @"Package name, author, or identifier";
    searchBar.delegate = self; searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    self.statusLabel = [[UILabel alloc] init]; self.statusLabel.text = @"Connect repository indexes to start discovering packages.";
    self.statusLabel.font = [UIFont systemFontOfSize:15]; self.statusLabel.textColor = FXSecondaryLabelColor();
    self.statusLabel.textAlignment = NSTextAlignmentCenter; self.statusLabel.numberOfLines = 0; self.statusLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:searchBar]; [self.view addSubview:self.statusLabel];
    [NSLayoutConstraint activateConstraints:@[
        [searchBar.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:8],
        [searchBar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:8],
        [searchBar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-8],
        [self.statusLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.statusLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [self.statusLabel.leadingAnchor constraintGreaterThanOrEqualToAnchor:self.view.leadingAnchor constant:28],
        [self.statusLabel.trailingAnchor constraintLessThanOrEqualToAnchor:self.view.trailingAnchor constant:-28]
    ]];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    self.statusLabel.text = searchBar.text.length ? @"No package indexes are available yet. Repository indexing will be added with the APT backend." : @"Enter a package name to search.";
}
@end

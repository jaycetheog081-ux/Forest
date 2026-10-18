#import "SourcesViewController.h"
#import "FXColors.h"
static NSString * const FXSourcesDefaultsKey = @"ForestSources";
@interface SourcesViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end
@implementation SourcesViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addSource)];
    [self render];
}
- (NSArray<NSString *> *)sources {
    NSArray *saved = [[NSUserDefaults standardUserDefaults] arrayForKey:FXSourcesDefaultsKey];
    return saved ?: @[];
}
- (void)render {
    for (UIView *view in self.view.subviews) [view removeFromSuperview];
    UILabel *heading = [self makeHeading:@"Sources"]; heading.translatesAutoresizingMaskIntoConstraints = NO;
    UILabel *subtitle = [[UILabel alloc] init];
    subtitle.text = @"Add and manage APT repository URLs. Source URLs are saved locally; index refresh is not yet connected.";
    subtitle.font = [UIFont systemFontOfSize:14]; subtitle.textColor = FXSecondaryLabelColor();
    subtitle.numberOfLines = 0; subtitle.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO; self.tableView.dataSource = self; self.tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension; self.tableView.estimatedRowHeight = 62;
    [self.view addSubview:heading]; [self.view addSubview:subtitle]; [self.view addSubview:self.tableView];
    [NSLayoutConstraint activateConstraints:@[
        [heading.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:18],
        [heading.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [heading.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        [subtitle.topAnchor constraintEqualToAnchor:heading.bottomAnchor constant:8],
        [subtitle.leadingAnchor constraintEqualToAnchor:heading.leadingAnchor],
        [subtitle.trailingAnchor constraintEqualToAnchor:heading.trailingAnchor],
        [self.tableView.topAnchor constraintEqualToAnchor:subtitle.bottomAnchor constant:8],
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
    [self.tableView reloadData];
}
- (void)addSource {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add Source" message:@"Enter an HTTP or HTTPS APT repository URL." preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *field) {
        field.placeholder = @"https://example.com/repo/"; field.keyboardType = UIKeyboardTypeURL;
        field.autocapitalizationType = UITextAutocapitalizationTypeNone; field.autocorrectionType = UITextAutocorrectionTypeNo;
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSString *value = [alert.textFields.firstObject.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSURL *url = [NSURL URLWithString:value];
        if (!url || ![@[@"http", @"https"] containsObject:url.scheme.lowercaseString] || !url.host.length) {
            [self showMessage:@"Invalid URL" message:@"Enter a valid repository URL beginning with http:// or https://."]; return;
        }
        NSMutableArray *items = [[self sources] mutableCopy];
        if (![items containsObject:value]) { [items addObject:value]; [[NSUserDefaults standardUserDefaults] setObject:items forKey:FXSourcesDefaultsKey]; }
        [self render];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)showMessage:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return MAX(1, self.sources.count); }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseID = @"ForestSourceCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID];
    if (self.sources.count == 0) {
        cell.textLabel.text = @"No sources added"; cell.detailTextLabel.text = @"Tap + to add a repository";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    } else {
        cell.textLabel.text = self.sources[indexPath.row]; cell.textLabel.numberOfLines = 2;
        cell.detailTextLabel.text = @"Saved locally · Not yet refreshed"; cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath { return self.sources.count > 0; }
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete && indexPath.row < self.sources.count) {
        NSMutableArray *items = [[self sources] mutableCopy]; [items removeObjectAtIndex:indexPath.row];
        [[NSUserDefaults standardUserDefaults] setObject:items forKey:FXSourcesDefaultsKey]; [self render];
    }
}
@end

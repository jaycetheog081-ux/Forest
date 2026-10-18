#import "FXBaseViewController.h"
#import "FXColors.h"
@implementation FXBaseViewController
- (void)viewDidLoad { [super viewDidLoad]; self.view.backgroundColor = FXGroupedBackgroundColor(); }
- (UILabel *)makeHeading:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.text = text; label.font = [UIFont systemFontOfSize:28 weight:UIFontWeightBold];
    label.textColor = FXLabelColor(); label.numberOfLines = 0;
    return label;
}
- (void)showEmptyStateWithTitle:(NSString *)title message:(NSString *)message {
    UIStackView *stack = [[UIStackView alloc] init];
    stack.axis = UILayoutConstraintAxisVertical; stack.alignment = UIStackViewAlignmentCenter;
    stack.spacing = 10; stack.translatesAutoresizingMaskIntoConstraints = NO;
    UIImageView *icon = [[UIImageView alloc] init];
    if (@available(iOS 13.0, *)) icon.image = [UIImage systemImageNamed:@"leaf"];
    icon.tintColor = FXSecondaryLabelColor(); icon.contentMode = UIViewContentModeScaleAspectFit;
    [NSLayoutConstraint activateConstraints:@[[icon.heightAnchor constraintEqualToConstant:44],[icon.widthAnchor constraintEqualToConstant:44]]];
    UILabel *heading = [[UILabel alloc] init]; heading.text = title;
    heading.font = [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold]; heading.textAlignment = NSTextAlignmentCenter;
    UILabel *body = [[UILabel alloc] init]; body.text = message; body.font = [UIFont systemFontOfSize:14];
    body.textColor = FXSecondaryLabelColor(); body.textAlignment = NSTextAlignmentCenter; body.numberOfLines = 0;
    [stack addArrangedSubview:icon]; [stack addArrangedSubview:heading]; [stack addArrangedSubview:body];
    [self.view addSubview:stack];
    [NSLayoutConstraint activateConstraints:@[
        [stack.leadingAnchor constraintGreaterThanOrEqualToAnchor:self.view.leadingAnchor constant:28],
        [stack.trailingAnchor constraintLessThanOrEqualToAnchor:self.view.trailingAnchor constant:-28],
        [stack.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [stack.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-20],
        [stack.widthAnchor constraintLessThanOrEqualToConstant:340]
    ]];
}
@end

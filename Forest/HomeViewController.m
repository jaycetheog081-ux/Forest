#import "HomeViewController.h"
#import "FXColors.h"
@implementation HomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scroll = [[UIScrollView alloc] init]; scroll.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:scroll];
    [NSLayoutConstraint activateConstraints:@[
        [scroll.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [scroll.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [scroll.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [scroll.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]
    ]];
    UIStackView *content = [[UIStackView alloc] init]; content.axis = UILayoutConstraintAxisVertical;
    content.spacing = 18; content.translatesAutoresizingMaskIntoConstraints = NO; [scroll addSubview:content];
    [NSLayoutConstraint activateConstraints:@[
        [content.topAnchor constraintEqualToAnchor:scroll.contentLayoutGuide.topAnchor constant:24],
        [content.bottomAnchor constraintEqualToAnchor:scroll.contentLayoutGuide.bottomAnchor constant:-28],
        [content.leadingAnchor constraintEqualToAnchor:scroll.frameLayoutGuide.leadingAnchor constant:20],
        [content.trailingAnchor constraintEqualToAnchor:scroll.frameLayoutGuide.trailingAnchor constant:-20]
    ]];
    UILabel *eyebrow = [[UILabel alloc] init]; eyebrow.text = @"A FRESH TAKE ON PACKAGE MANAGEMENT";
    eyebrow.font = [UIFont systemFontOfSize:11 weight:UIFontWeightBold];
    eyebrow.textColor = [UIColor colorWithRed:0.19 green:0.48 blue:0.31 alpha:1.0];
    UILabel *title = [self makeHeading:@"Welcome to Forest"];
    UILabel *subtitle = [[UILabel alloc] init]; subtitle.text = @"A calmer, cleaner home for your jailbreak packages.";
    subtitle.font = [UIFont systemFontOfSize:16]; subtitle.textColor = FXSecondaryLabelColor(); subtitle.numberOfLines = 0;
    UIView *hero = [[UIView alloc] init]; hero.backgroundColor = [UIColor colorWithRed:0.12 green:0.34 blue:0.22 alpha:1.0];
    hero.layer.cornerRadius = 18; hero.clipsToBounds = YES;
    UIStackView *heroStack = [[UIStackView alloc] init]; heroStack.axis = UILayoutConstraintAxisVertical;
    heroStack.spacing = 9; heroStack.translatesAutoresizingMaskIntoConstraints = NO; [hero addSubview:heroStack];
    [NSLayoutConstraint activateConstraints:@[
        [heroStack.topAnchor constraintEqualToAnchor:hero.topAnchor constant:22],
        [heroStack.bottomAnchor constraintEqualToAnchor:hero.bottomAnchor constant:-22],
        [heroStack.leadingAnchor constraintEqualToAnchor:hero.leadingAnchor constant:20],
        [heroStack.trailingAnchor constraintEqualToAnchor:hero.trailingAnchor constant:-20]
    ]];
    UILabel *heroTitle = [[UILabel alloc] init]; heroTitle.text = @"Grow your setup.";
    heroTitle.font = [UIFont systemFontOfSize:23 weight:UIFontWeightBold]; heroTitle.textColor = UIColor.whiteColor;
    UILabel *heroText = [[UILabel alloc] init]; heroText.text = @"Explore sources, discover packages, and keep your jailbreak organized.";
    heroText.font = [UIFont systemFontOfSize:14]; heroText.textColor = [UIColor colorWithWhite:1 alpha:0.88]; heroText.numberOfLines = 0;
    [heroStack addArrangedSubview:heroTitle]; [heroStack addArrangedSubview:heroText];
    UILabel *quick = [[UILabel alloc] init]; quick.text = @"Quick start"; quick.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
    UIView *card = [[UIView alloc] init]; card.backgroundColor = FXSecondaryGroupedBackgroundColor();
    card.layer.cornerRadius = 16; card.clipsToBounds = YES;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem]; button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setTitle:@"  Manage package sources     ›" forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
    button.titleEdgeInsets = UIEdgeInsetsMake(18,16,18,8);
    [button addTarget:self action:@selector(openSources) forControlEvents:UIControlEventTouchUpInside]; [card addSubview:button];
    [NSLayoutConstraint activateConstraints:@[
        [button.topAnchor constraintEqualToAnchor:card.topAnchor],[button.bottomAnchor constraintEqualToAnchor:card.bottomAnchor],
        [button.leadingAnchor constraintEqualToAnchor:card.leadingAnchor],[button.trailingAnchor constraintEqualToAnchor:card.trailingAnchor]
    ]];
    UILabel *notice = [[UILabel alloc] init];
    notice.text = @"Early build · Package transactions are disabled until a compatible APT/dpkg backend and privileged helper are integrated.";
    notice.font = [UIFont systemFontOfSize:12]; notice.textColor = FXSecondaryLabelColor(); notice.numberOfLines = 0;
    [content addArrangedSubview:eyebrow]; [content addArrangedSubview:title]; [content addArrangedSubview:subtitle];
    [content addArrangedSubview:hero]; [content addArrangedSubview:quick]; [content addArrangedSubview:card]; [content addArrangedSubview:notice];
}
- (void)openSources { self.tabBarController.selectedIndex = 1; }
@end

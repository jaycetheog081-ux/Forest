#import <UIKit/UIKit.h>
@interface FXBaseViewController : UIViewController
- (UILabel *)makeHeading:(NSString *)text;
- (void)showEmptyStateWithTitle:(NSString *)title message:(NSString *)message;
@end

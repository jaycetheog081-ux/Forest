#import <UIKit/UIKit.h>

static inline UIColor *FXBackgroundColor(void) {
    if (@available(iOS 13.0, *)) return UIColor.systemBackgroundColor;
    return UIColor.whiteColor;
}
static inline UIColor *FXGroupedBackgroundColor(void) {
    if (@available(iOS 13.0, *)) return UIColor.systemGroupedBackgroundColor;
    return [UIColor colorWithWhite:0.96 alpha:1.0];
}
static inline UIColor *FXSecondaryGroupedBackgroundColor(void) {
    if (@available(iOS 13.0, *)) return UIColor.secondarySystemGroupedBackgroundColor;
    return UIColor.whiteColor;
}
static inline UIColor *FXLabelColor(void) {
    if (@available(iOS 13.0, *)) return UIColor.labelColor;
    return UIColor.blackColor;
}
static inline UIColor *FXSecondaryLabelColor(void) {
    if (@available(iOS 13.0, *)) return UIColor.secondaryLabelColor;
    return [UIColor darkGrayColor];
}
static inline UIColor *FXTertiaryLabelColor(void) {
    if (@available(iOS 13.0, *)) return UIColor.tertiaryLabelColor;
    return [UIColor grayColor];
}
static inline UIColor *FXAccentColor(void) {
    if (@available(iOS 13.0, *)) return UIColor.systemIndigoColor;
    return [UIColor colorWithRed:0.30 green:0.32 blue:0.78 alpha:1.0];
}

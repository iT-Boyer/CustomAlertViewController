//
//  JHUnitOrgAlertController.h
//  JHUnitOrgAlertController
//
//  Created by boyer on 2021/10/11.
//  Copyright © 2021 linsir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHAlertAction.h"
NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    JHAlertControllerStyleAlert,
    JHAlertControllerStyleSheet,
    JHAlertControllerStyleToast
} JHAlertControllerStyle;
@interface JHUnitOrgAlertController : UIViewController
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image style:(JHAlertControllerStyle)style;

- (instancetype)showMessage:(NSString *)message dismissDelay:(NSTimeInterval)second style:(JHAlertControllerStyle)style;

- (void)addAction:(JHAlertAction *)action;
@end

NS_ASSUME_NONNULL_END

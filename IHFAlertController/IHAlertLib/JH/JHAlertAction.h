//
//  JHAlertAction.h
//  JHAlertAction
//
//  Created by boyer on 2021/10/11.
//  Copyright © 2021 linsir. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    JHAlertActionStyleDefault,
    JHAlertActionStyleCancle,
    JHAlertActionStyleConfirm
} JHAlertActionStyle;

@interface JHAlertAction : UIButton
- (instancetype)initWithTitle:(NSString *)title style:(JHAlertActionStyle)style action:(void (^)())action;

@end

NS_ASSUME_NONNULL_END

//
//  JHAlertAction.m
//  JHAlertAction
//
//  Created by boyer on 2021/10/11.
//  Copyright © 2021 linsir. All rights reserved.
//

#import "JHAlertAction.h"
@interface JHAlertAction ()

@property (nonatomic, copy) void (^action)();

@property (nonatomic, strong) UIImageView *sepatator;

@end
@implementation JHAlertAction
- (instancetype)initWithTitle:(NSString *)title style:(JHAlertActionStyle)style action:(void (^)())action {
    if (self = [super init]) {
        
        self.action = action;
        [self addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
        
        [self setTitle:title forState:UIControlStateNormal];
        
        if (style == JHAlertActionStyleDefault) {
            [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        } else if (style == JHAlertActionStyleCancle) {
            [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        } else if (style == JHAlertActionStyleConfirm) {
            [self setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
//        [self addSeparator];
    }
    return self;
}

- (void)tapped:(JHAlertAction *)action {
    if (self.action) self.action();
}

- (void)addSeparator {
    self.sepatator = [[UIImageView alloc] init];
    [self addSubview:_sepatator];
    
    self.sepatator.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    
    self.sepatator.translatesAutoresizingMaskIntoConstraints = NO;
    [self.sepatator.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.sepatator.leadingAnchor constraintEqualToAnchor:self.layoutMarginsGuide.leadingAnchor constant:8.0].active = YES;
    [self.sepatator.trailingAnchor constraintEqualToAnchor:self.layoutMarginsGuide.trailingAnchor constant:-8.0].active = YES;
    [self.sepatator.heightAnchor constraintEqualToConstant:1.0].active = YES;
}
@end

//
//  JHUnitOrgAlertController.m
//  JHUnitOrgAlertController
//
//  Created by boyer on 2021/10/11.
//  Copyright © 2021 linsir. All rights reserved.
//

#import "JHUnitOrgAlertController.h"
#import <Masonry/Masonry.h>
@interface JHUnitOrgAlertController ()
@property (assign, nonatomic) JHAlertControllerStyle style;
@property (strong, nonatomic) UIView *alertView;
@property (strong, nonatomic) UILabel *alertTitle;
@property (strong, nonatomic) UILabel *alertMessage;
@property (strong, nonatomic) UIStackView *alertActionStackView;
@end

@implementation JHUnitOrgAlertController

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image style:(JHAlertControllerStyle)style {
    if ([super init]) {
        [self createView];
        self.style = style;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        _alertTitle.text = title;
        _alertMessage.text = message;
    }
    return self;
}

- (instancetype)showMessage:(NSString *)message dismissDelay:(NSTimeInterval)second style:(JHAlertControllerStyle)style
{
    if ([super init]) {
        [self createMsgView];
        self.style = style;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        _alertMessage.text = message;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    if (self.style == JHAlertControllerStyleToast) {
        [self addRoundedCorners:UIRectCornerBottomLeft|UIRectCornerTopRight|UIRectCornerBottomRight forView:self.alertView];
        [self performSelector:@selector(dismissAlertController:) withObject:nil afterDelay:3];
    }
}
-(void)createMsgView
{
    self.view.backgroundColor = [UIColor clearColor];
    self.alertView = [UIView new];
    self.alertView.backgroundColor = [UIColor whiteColor];
    self.alertMessage = [UILabel new];
    self.alertMessage.numberOfLines = 0;
    self.alertMessage.textAlignment = NSTextAlignmentCenter;
    self.alertMessage.font = [UIFont systemFontOfSize:16];
    self.alertMessage.textColor = [UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1.0];
    
    [self.view addSubview:self.alertView];
    [self.alertView addSubview:self.alertMessage];
    
    //layout
    [self.alertView mas_makeConstraints:^(MASConstraintMaker *make){
        make.center.equalTo(@0);
        make.left.equalTo(@48);
    }];
    [self.alertMessage mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(@20);
        make.center.equalTo(@0);
        make.left.equalTo(@20);
    }];
}
- (void)addRoundedCorners:(UIRectCorner)corners forView:(UIView *)view
{
    [view sizeToFit];
    //圆角+边框色
   CAShapeLayer *maskLayer = [CAShapeLayer layer];
   maskLayer.frame = view.bounds;
   CAShapeLayer *borderLayer = [CAShapeLayer layer];
   borderLayer.frame = view.bounds;
   borderLayer.lineWidth = 1.5f;
   borderLayer.strokeColor = [UIColor whiteColor].CGColor;
   borderLayer.fillColor = [UIColor clearColor].CGColor;
   CGSize radii = CGSizeMake(14, 14);
   UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:radii];
   maskLayer.path = bezierPath.CGPath;
   borderLayer.path = bezierPath.CGPath;
   [view.layer insertSublayer:borderLayer atIndex:0];
   [view.layer setMask:maskLayer];
}
-(void)createView
{
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:.6];
    self.alertView = [UIView new];
    _alertView.layer.cornerRadius = 8.0;
    self.alertView.backgroundColor = [UIColor whiteColor];
    self.alertTitle = [UILabel new];
    self.alertMessage = [UILabel new];
    self.alertMessage.numberOfLines = 0;
    self.alertMessage.textAlignment = NSTextAlignmentCenter;
    self.alertMessage.font = [UIFont systemFontOfSize:16];
    self.alertMessage.textColor = [UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1.0];
    self.alertActionStackView = [UIStackView new];
    
    [self.view addSubview:self.alertView];
    [self.alertView addSubview:self.alertTitle];
    [self.alertView addSubview:self.alertMessage];
    [self.alertView addSubview:self.alertActionStackView];
    
    //layout
    [self.alertView mas_makeConstraints:^(MASConstraintMaker *make){
        make.center.equalTo(@0);
        make.left.equalTo(@48);
    }];
    [self.alertMessage mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(@20);
        make.centerX.equalTo(@0);
        make.left.equalTo(@20);
    }];
    [self.alertActionStackView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.alertMessage.mas_bottom).offset(24);
        make.left.equalTo(@27);
        make.centerX.equalTo(@0);
        make.bottom.equalTo(@-18);
        make.height.equalTo(@38);
    }];
}

- (void)addAction:(JHAlertAction *)alertAction {
    [_alertActionStackView addArrangedSubview:alertAction];
    _alertActionStackView.distribution = UIStackViewDistributionFillEqually;
    
    if ([_alertActionStackView.arrangedSubviews count] > 2) {
        _alertActionStackView.axis = UILayoutConstraintAxisVertical;
    } else {
        _alertActionStackView.axis = UILayoutConstraintAxisHorizontal;
        _alertActionStackView.spacing = 20;
    }
    
    [alertAction addTarget:self action:@selector(dismissAlertController:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dismissAlertController:(JHAlertAction *)alertAction {
    [self animationDismissViewController];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)animationDismissViewController
{
    
}
@end

//
//  ViewController.m
//  IHFAlertController
//
//  Created by linsir on 16/5/27.
//  Copyright © 2016年 linsir. All rights reserved.
//

#import "ViewController.h"
#import "IHFAlertController.h"
#import "IHFAlertAction.h"
#import "JHUnitOrgAlertController.h"

@interface ViewController ()

@end

#define alert_message @"我是message我是message我是message我是message我是message"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)alertTouch:(id)sender {
    
    UIImage *image = [UIImage imageNamed:@"cartoon"];
    IHFAlertController *alertController = [[IHFAlertController alloc] initWithTitle:@"提示" message:alert_message image:image style:IHFAlertControllerStyleAlert];
    
    IHFAlertAction *cancleAction = [[IHFAlertAction alloc] initWithTitle:@"取消" style:IHFAlertActionStyleCancle action:^{
        NSLog(@"取消");
    }];
    [alertController addAction:cancleAction];
    
    IHFAlertAction *confirmAction = [[IHFAlertAction alloc] initWithTitle:@"确定" style:IHFAlertActionStyleConfirm action:^{
        NSLog(@"确定");
    }];
    [alertController addAction:confirmAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


- (IBAction)sheetTouch:(id)sender {
    
    UIImage *image = [UIImage imageNamed:@"beautiful_girl"];
    IHFAlertController *sheetController = [[IHFAlertController alloc] initWithTitle:@"提示" message:alert_message image:image style:IHFAlertControllerStyleSheet];
    
    IHFAlertAction *cancleAction = [[IHFAlertAction alloc] initWithTitle:@"取消" style:IHFAlertActionStyleCancle action:^{
        NSLog(@"取消");
    }];
    [sheetController addAction:cancleAction];
    
    IHFAlertAction *confirm = [[IHFAlertAction alloc] initWithTitle:@"确认" style:IHFAlertActionStyleConfirm action:^{
        NSLog(@"确认");
    }];
    [sheetController addAction:confirm];
    
    [self presentViewController:sheetController animated:YES completion:nil];
}

- (IBAction)ThreeAlertTouch:(id)sender {
    
    IHFAlertController *alertController = [[IHFAlertController alloc] initWithTitle:@"提示" message:alert_message image:[UIImage imageNamed:@"beautiful_girl"] style:IHFAlertControllerStyleAlert];
    
    IHFAlertAction *yourGoodAction = [[IHFAlertAction alloc] initWithTitle:@"你好" style:IHFAlertActionStyleCancle action:^{
        NSLog(@"你好");
    }];
    [alertController addAction:yourGoodAction];
    
    IHFAlertAction *meGoodAction = [[IHFAlertAction alloc] initWithTitle:@"我好" style:IHFAlertActionStyleDefault action:^{
        NSLog(@"我好");
    }];
    [alertController addAction:meGoodAction];
    
    IHFAlertAction *allGoodAction = [[IHFAlertAction alloc] initWithTitle:@"大家好" style:IHFAlertActionStyleConfirm action:^{
        NSLog(@"大家好");
    }];
    [alertController addAction:allGoodAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)ThreeSheetTouch1:(id)sender {
    
    UIImage *image = [UIImage imageNamed:@"beauty"];
    IHFAlertController *sheetController = [[IHFAlertController alloc] initWithTitle:@"提示" message:alert_message image:image style:IHFAlertControllerStyleSheet];
    
    IHFAlertAction *cancleAction = [[IHFAlertAction alloc] initWithTitle:@"取消" style:IHFAlertActionStyleCancle action:^{
        NSLog(@"取消");
    }];
    [sheetController addAction:cancleAction];
    
    IHFAlertAction *delete = [[IHFAlertAction alloc] initWithTitle:@"删除" style:IHFAlertActionStyleCancle action:^{
        NSLog(@"删除");
    }];
    [sheetController addAction:delete];
    
    IHFAlertAction *confirm = [[IHFAlertAction alloc] initWithTitle:@"确认" style:IHFAlertActionStyleConfirm action:^{
        NSLog(@"确认");
    }];
    [sheetController addAction:confirm];
    
    [self presentViewController:sheetController animated:YES completion:nil];
    
}

- (IBAction)ThreeSheetTouch:(id)sender
{
    JHUnitOrgAlertController *alert = [[JHUnitOrgAlertController alloc] initWithTitle:nil message:@"nihhoa" image:nil style:JHAlertControllerStyleAlert];
//    JHUnitOrgAlertController *alert = [[JHUnitOrgAlertController alloc] showMessage:@"nihao" dismissDelay:4 style:JHAlertControllerStyleToast];
    JHAlertAction *cancel = [[JHAlertAction alloc] initWithTitle:@"取消" style:JHAlertActionStyleCancle action:^{
        
    }];
    cancel.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancel setTitleColor:[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1.0] forState:UIControlStateNormal];
    cancel.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0];
    cancel.layer.masksToBounds = true;
    cancel.layer.cornerRadius = 19;
    
    JHAlertAction *ok = [[JHAlertAction alloc] initWithTitle:@"确定" style:JHAlertActionStyleCancle action:^{
        
    }];
    ok.titleLabel.font = [UIFont systemFontOfSize:16];
    [ok setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    ok.backgroundColor = [UIColor colorWithRed:4/255.0 green:161/255.0 blue:116/255.0 alpha:1.0];
    ok.layer.masksToBounds = true;
    ok.layer.cornerRadius = 19;
    
    [alert addAction:cancel];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

@end

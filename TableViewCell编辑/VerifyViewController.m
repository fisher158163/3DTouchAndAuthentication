//
//  VerifyViewController.m
//  TableViewCell编辑
//
//  Created by Liyu on 16/8/19.
//  Copyright © 2016年 liyu. All rights reserved.
//

#import "VerifyViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import <sys/utsname.h>
#import "AlipayViewController.h"


#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)

@interface VerifyViewController ()

@end

@implementation VerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"解锁";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *fingerImage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-32, 160, 64, 64)];
    fingerImage.image = [UIImage imageNamed:@"Finger@3x"];
    [self.view addSubview:fingerImage];
    
    UILabel *tipslabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-70, 240, 140, 40)];
    tipslabel.text = @"点击进行指纹解锁";
    [tipslabel sizeToFit];
    tipslabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:tipslabel];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:52/255.0f green:51/255.0f blue:57/255.0f alpha:1.0f]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];

}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self clickTouchID];

}


//点击TouchID
-(void)clickTouchID
{
    
    LAContext *context = [[LAContext alloc]init];
    NSError *error = nil;
    // 第一步判断是否支持Touch ID 或者 本机是否已经录入指纹
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"请验证已有指纹" reply:^(BOOL success, NSError * _Nullable error) {
            if (error) {
                NSLog(@"验证失败");
            }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                //进入验证成功的页面
                AlipayViewController *payVC = [[AlipayViewController alloc]init];
                [self.navigationController presentViewController:payVC animated:YES completion:nil];
            });
            
            }
        }];
    }else{
    
        if ([self isSimulator]) {
            [[[UIAlertView alloc] initWithTitle:@"提示" message:@"请用真机测试" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
        }else{
            
            [[[UIAlertView alloc] initWithTitle:@"提示" message:@"不支持Touch ID哦" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
        
        }
    
    }
    
}


//判断当前设备是否为模拟器
-(BOOL)isSimulator
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceMachine = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceMachine isEqualToString:@"i386"]||[deviceMachine isEqualToString:@"x86_64"]) {
        return YES;
    }
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

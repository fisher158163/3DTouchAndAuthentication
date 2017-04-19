//
//  AlipayViewController.m
//  TableViewCell编辑
//
//  Created by Liyu on 16/8/19.
//  Copyright © 2016年 liyu. All rights reserved.
//

#import "AlipayViewController.h"


#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height)

@interface AlipayViewController ()

@end

@implementation AlipayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *backgroundImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    backgroundImage.image = [UIImage imageNamed:@"zhifubao.png"];
    [self.view addSubview:backgroundImage];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, 40, 40, 30)];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

-(void)popBack
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
   // NSLog(@"clicked");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

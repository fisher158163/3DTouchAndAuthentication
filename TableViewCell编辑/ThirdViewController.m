//
//  ThirdViewController.m
//  TableViewCell编辑
//
//  Created by Liyu on 16/8/19.
//  Copyright © 2016年 liyu. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第三";
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:52/255.0f green:51/255.0f blue:57/255.0f alpha:1.0f]];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];

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

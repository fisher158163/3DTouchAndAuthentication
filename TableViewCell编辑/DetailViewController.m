//
//  DetailViewController.m
//  TableViewCell编辑
//
//  Created by Liyu on 16/8/18.
//  Copyright © 2016年 liyu. All rights reserved.
//

#import "DetailViewController.h"

#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height)

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详细页";
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
    UILabel *textLb= [[UILabel alloc]initWithFrame:CGRectMake(0, 150, kScreenWidth, 40)];
    textLb.center = self.view.center;
    textLb.text = self.textStr;
    textLb.textAlignment = NSTextAlignmentCenter;
    textLb.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:textLb];
    
    UIImageView *headImage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-50, 200, 120, 120)];
    headImage.image = [UIImage imageNamed:self.headImageStr];
    headImage.layer.cornerRadius = 60;
    headImage.layer.masksToBounds = YES;

    [self.view addSubview:headImage];

    
}


//添加peek底部菜单
-(NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction * action1 = [UIPreviewAction actionWithTitle:@"收藏" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"收藏");
    }];
    
    UIPreviewAction * action2 = [UIPreviewAction actionWithTitle:@"删除" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"删除");
    }];
    
    UIPreviewAction * action3 = [UIPreviewAction actionWithTitle:@"保存" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
            NSLog(@"保存");

        
    }];
    NSArray *items = @[action1,action3,action2];
        
    return items;
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

//
//  ViewController.m
//  TableViewCell编辑
//
//  Created by 李玉 on 16/8/18.
//  Copyright © 2016年 liyu. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"
#import "DetailViewController.h"
#import "DetailTableViewCell.h"


#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height)
#define kDEGRE_TO_RADIANS(angel)  ((angel)/180*M_PI)

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//ImageView旋转状态枚举
typedef NS_ENUM(NSInteger,RotateState)
{
    RotateStateStop = 0,
    RotateStateRun,

};

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>
{
    //旋转角度
    CGFloat imageAngel;
    //旋转图片
    UIImageView *rotateImage;
    //旋转状态
    RotateState *rotateState;
    
    
}

@property(nonatomic,strong)UITableView *mTableView;

@property(nonatomic,strong)UITableViewCell *mTableViewCell;
//数据源
@property(nonatomic,strong)NSMutableArray *nameArray;
@property(nonatomic,strong)NSMutableArray *headImageArray;

//音乐播放器
@property(nonatomic,strong)AVAudioPlayer *audioPlayer;
;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我的";
    _nameArray = [NSMutableArray arrayWithObjects:@"Noelia Marin",@"Enrique Santos",@"Roberto Crespo",@"Veronica Cortes",@"Nerea Alonso",@"Silvia Herrero",@"Susana Aguilar",@"Alejandro Moya",@"Inmaculada Cortes",@"Teresa Saez",@"Lorenzo Vicente",@"Joel Mattila",nil];
    _headImageArray = [NSMutableArray arrayWithObjects:@"79@2x.jpg",@"89@2x.jpg",@"15@2x.jpg",@"27@2x.jpg",@"37@2x.jpg",@"92@2x.jpg",@"47@2x.jpg",@"52@2x.jpg",@"63@2x.jpg",@"1@2x.jpg",@"4@2x.jpg",@"5@2x.jpg", nil];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.mTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    
    [self.view addSubview:self.mTableView];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.backgroundColor = [UIColor grayColor];
    
    //注册cell
    //[self.mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.mTableView registerNib:[UINib nibWithNibName:@"DetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"DetailCell"];
    
    [self buildBarButtonItem];
    
    
    // 设置导航栏的颜色
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:52/255.0f green:51/255.0f blue:57/255.0f alpha:1.0f]];
    
    // 设置navigationBar上的字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
}


-(void)buildBarButtonItem
{
    rotateImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"barButtonImg"]];
    rotateImage.autoresizingMask = UIViewAutoresizingNone;
    rotateImage.contentMode = UIViewContentModeScaleToFill;
    rotateImage.bounds = CGRectMake(0, 0, 30, 30);
    rotateImage.layer.cornerRadius = 15;
    rotateImage.layer.masksToBounds = YES;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn addSubview:rotateImage];
    rotateImage.center = btn.center;
    [btn addTarget:self action:@selector(animation) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];

}


-(void)animation
{
    if (rotateState == RotateStateStop) {
        
        rotateState = RotateStateRun;
        
        [self rotateAnimate];
        [self playMusic];
        
    }else{
        
        rotateState = RotateStateStop;
        [self stopMusic];
    
    }

}

//开始旋转动画
-(void)rotateAnimate
{
    
    imageAngel += 50;
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        rotateImage.transform = CGAffineTransformMakeRotation(kDEGRE_TO_RADIANS(imageAngel));
        
    } completion:^(BOOL finished) {
        
        if (rotateState == RotateStateRun) {
            [self rotateAnimate];
        }
    }];
    
}


//开始播放音乐
-(void)playMusic
{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"电音之王" ofType:@"mp3"];
    NSURL *url = [[NSURL alloc]initFileURLWithPath:filePath];
    AVAudioPlayer *player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    self.audioPlayer = player;
    [self.audioPlayer prepareToPlay];
    //循环次数，-1为无限循环
    self.audioPlayer.numberOfLoops = -1;
    [self.audioPlayer play];
    
}


//关闭音乐
-(void)stopMusic
{
    [self.audioPlayer stop];

}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _nameArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
    
    cell.nameLabel.text = _nameArray[indexPath.row];
    cell.headImage.image = [UIImage imageNamed:_headImageArray[indexPath.row]];
    [self registerForPreviewingWithDelegate:self sourceView:cell];
    
    UIColor *color1 = UIColorFromRGB(0x804C5F);
    UIColor *color2 =UIColorFromRGB(0x794759);
    cell.contentView.backgroundColor = indexPath.row %2 == 0 ? color1:color2;
    return cell;

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *Vc = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:Vc animated:YES];
    
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    editingStyle = UITableViewCellEditingStyleDelete;
    
}

#pragma mark 确定是否能编辑(删除和添加)
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"点击了删除按钮");
        //必须先从数组中删除
        [_nameArray removeObjectAtIndex:indexPath.row];
        [_headImageArray removeObjectAtIndex:indexPath.row];

        [self.mTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        [self.mTableView reloadData];
    
}];
    
    UITableViewRowAction *editRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"编辑" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"点击了编辑按钮");
    }];
    
    //定义RowAction的颜色
    editRowAction.backgroundColor = [UIColor colorWithRed:0 green:124/255.0 blue:223/255.0 alpha:0.8];
    
    
    UITableViewRowAction *moreRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"添加数据" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"点击了添加数据按钮");
        [_nameArray insertObject:@"新添加的数据" atIndex:indexPath.row];
        //[_nameArray insertObject:@"barButtonImg.png" atIndex:indexPath.row];

        [self.mTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        [self.mTableView reloadData];
    
    }];
    
    
    return @[deleteRowAction,editRowAction,moreRowAction];
    
}


#pragma mark - UIViewControllerPreviewingDelegate


#pragma mark - peek的代理方法，轻按即可触发弹出vc
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    
    DetailViewController *Vc = [[DetailViewController alloc]init];
    NSIndexPath *indexPath = [self.mTableView indexPathForCell:(UITableViewCell *)[previewingContext sourceView]];
    Vc.textStr = _nameArray[indexPath.row];
    Vc.headImageStr = _headImageArray[indexPath.row];
    return Vc;
}


#pragma mark -  pop的代理方法，在此处可对将要进入的vc进行处理
-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    if (viewControllerToCommit) {
        [self showViewController:viewControllerToCommit sender:self];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

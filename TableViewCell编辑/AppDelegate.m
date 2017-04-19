//
//  AppDelegate.m
//  TableViewCell编辑
//
//  Created by 李玉 on 16/8/18.
//  Copyright © 2016年 liyu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "VerifyViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    NSArray *ctlName = @[@"ViewController",@"VerifyViewController",@"ThirdViewController",@"ForthViewController"];
    NSArray *titles = @[@"Touch",@"解锁",@"第三",@"第四"];
    NSArray *imgArr = @[@"tabbar_mainframe@2x",@"tabbar_contacts@2x",@"tabbar_discover@2x",@"tabbar_me@2x"];
    NSArray *selectedImgArr = @[@"tabbar_mainframeHL@2x",@"tabbar_contactsHL@2x",@"tabbar_discoverHL@2x",@"tabbar_meHL@2x"];
    NSMutableArray *ctlArr = [NSMutableArray array];
    for (int i = 0; i < ctlName.count; i++) {
        UIViewController *ctl = [[NSClassFromString(ctlName[i]) alloc] init];
        
        ctl.tabBarItem.image = [UIImage imageNamed:imgArr[i]];
        ctl.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImgArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        ctl.tabBarItem.title = titles[i];
        
        UINavigationController*nav = [[UINavigationController alloc] initWithRootViewController:ctl];
        [ctlArr addObject:nav];
    }
    //不渲染TabBarItem字体颜色
    //[[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}
   //                                             forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:12.0],NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    
    
   // [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]}
   //                                          forState:UIControlStateSelected];
    
    
    UIColor *selectColor = [UIColor colorWithRed:0/255.0 green:189/255.0 blue:0/255.0 alpha:1.0];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:selectColor, NSForegroundColorAttributeName, [UIFont systemFontOfSize:12.0],NSFontAttributeName,nil] forState:UIControlStateSelected];
    
    UITabBarController *tabCtl = [[UITabBarController alloc] init];
    tabCtl.viewControllers = ctlArr;
    self.window.rootViewController = tabCtl;

    [self.window makeKeyAndVisible];
    //[[UIApplication sharedApplication] setst]
    [self setUp3DTouch];
    return YES;
}


//设置3D Touch
-(void)setUp3DTouch
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=9.0) {
        //自定义图标
       // UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@""];
        
        UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc]initWithType:@"item1类型" localizedTitle:@"点击播放" localizedSubtitle:@"电音之王" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay] userInfo:nil];
        
        UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:@"item2类型" localizedTitle:@"添加" localizedSubtitle:@"新的心跳" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd] userInfo:nil];
        
        UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc]initWithType:@"item3类型" localizedTitle:@"分享" localizedSubtitle:@"迷迭香" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare] userInfo:nil];

        UIApplicationShortcutItem *item4 = [[UIApplicationShortcutItem alloc]initWithType:@"item4类型" localizedTitle:@"返回主页" localizedSubtitle:@"主页" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeHome] userInfo:nil];

        NSArray *itemArray = [[NSArray alloc]initWithObjects:item4,item3,item2,item1,nil];
        [[UIApplication sharedApplication] setShortcutItems:itemArray];
        
        
    }

}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  ACTabBarController.m
//  Acfun
//
//  Created by 黄文伟 on 16/5/9.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import "ACTabBarController.h"
#import "ACMineViewController.h"
#import "ACChannelViewController.h"
#import "ACAttentionViewController.h"
#import "ACHomePageViewController.h"
#import "ACNavigationController.h"
@interface ACTabBarController ()
@end

@implementation ACTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpFont];
    
    [self setUpAllChildView];
}
//设置字体，颜色
- (void)setUpFont
{
    //取出所有ACTabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:
                          @[[self class]]];
    //设置选中状态下字体
    NSDictionary *dictSelected = @{
                                   NSFontAttributeName :[UIFont systemFontOfSize:15],
                                   NSForegroundColorAttributeName : [UIColor redColor]
                                   };
    
    
    [item setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    //设置普通状态下字体
    NSDictionary *dictNormal = @{
                                 NSFontAttributeName :[UIFont systemFontOfSize:15],
                                 NSForegroundColorAttributeName : [UIColor lightGrayColor]
                                 };
    [item setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    
}
- (void)setUpAllChildView
{
    //首页控制器
    
    ACHomePageViewController *home = [[ACHomePageViewController alloc] init];

    ACNavigationController * nav = [[ACNavigationController alloc] initWithRootViewController:home];
    
    home.title = @"首页";
    
    home.tabBarItem.image = [UIImage imageNamed:@""];
    
    [self addChildViewController:nav];
    
    //频道 控制器
    ACChannelViewController *channel = [[ACChannelViewController alloc] init];
    
    ACNavigationController * nav1 = [[ACNavigationController alloc] initWithRootViewController:channel];
    channel.title = @"频道";

    [self addChildViewController:nav1];
    
    //关注 控制器
    ACAttentionViewController *attention = [[ACAttentionViewController alloc] init];
    
    ACNavigationController * nav2 = [[ACNavigationController alloc] initWithRootViewController:attention];
    attention.title = @"关注";

    
    [self addChildViewController:nav2];
    //我的 控制器
    ACMineViewController *mine = [[ACMineViewController alloc]init];
    
        ACNavigationController * nav3 = [[ACNavigationController alloc] initWithRootViewController:mine];
    mine.title = @"我的";
    mine.tabBarItem.image = [UIImage originImageWithName:@"iPadFavBangumiAnimationFrame-1"];
   [ mine.tabBarItem setSelectedImage:[UIImage originImageWithName:@"iPadFavBangumiAnimationFrame8"]];
    
    [self addChildViewController:nav3];
    

}



@end

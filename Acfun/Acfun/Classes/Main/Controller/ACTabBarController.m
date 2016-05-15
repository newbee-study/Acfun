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
#import "ACTabBar.h"
@interface ACTabBarController () <ACTabBarDelegate>
@end

@implementation ACTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpFont];
    
    [self setUpAllChildView];
    
    self.tabBar.hidden = YES;
    
    
    

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    ACTabBar *tabbar = [[ACTabBar alloc] init];
    
    tabbar.delegate = self;
    
    tabbar.items = self.tabBar.items;
    
    //    [self setValue:tabbar forKey:@"tabBar"];
    tabbar.frame = self.tabBar.frame;
    
    [self.view addSubview:tabbar];

    
}
//自定义TabBar代理方法
- (void)ACTabBarClickButton:(ACTabBarButton *)button
{
    UIButton *btn = button;
    self.selectedIndex = btn.tag;
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
    
    [self setUpChildViewControllerWith:home title:@"首页" image:@"tab_bar_icon_one_normal" selectedImage:@"tab_bar_icon_one_selected"];
    
    //频道 控制器
    ACChannelViewController *channel = [[ACChannelViewController alloc] init];
    
    [self setUpChildViewControllerWith:channel title:@"频道" image:@"tab_bar_icon_two_normal" selectedImage:@"tab_bar_icon_two_selected"];
    
    //关注 控制器
    ACAttentionViewController *attention = [[ACAttentionViewController alloc] init];
    
    [self setUpChildViewControllerWith:attention title:@"关注" image:@"tab_bar_icon_three_normal" selectedImage:@"tab_bar_icon_three_selected"];
    //我的 控制器
    ACMineViewController *mine = [[ACMineViewController alloc]init];
    
    [self setUpChildViewControllerWith:mine title:@"我的" image:@"tab_bar_icon_four_normal" selectedImage:@"tab_bar_icon_four_selected"];
    

}
- (void)setUpChildViewControllerWith:(UIViewController *)vc title:(NSString *)title
                                    image:(NSString *)image selectedImage:(NSString *)selectedImage
{

    
    ACNavigationController * nav = [[ACNavigationController alloc] initWithRootViewController:vc];
    vc.title = title;
    vc.navigationItem.title = nil;

    [vc.tabBarItem setImage:[UIImage originImageWithName:image]];
    [vc.tabBarItem setSelectedImage:[UIImage originImageWithName:selectedImage]];
    
    [self addChildViewController:nav];
    
    

    


}



@end

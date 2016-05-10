//
//  ACNavigationController.m
//  Acfun
//
//  Created by 黄文伟 on 16/5/9.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import "ACNavigationController.h"

@interface ACNavigationController ()

@end

@implementation ACNavigationController

+(void)load
{
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    [bar setBarTintColor:[[UIColor redColor] colorWithAlphaComponent:0.5]];

}
- (void)viewDidLoad {
    [super viewDidLoad];
  
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    if (!self.childViewControllers.count) {
       navBar.hidden = YES;
    }
    return [super popViewControllerAnimated:animated];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
//    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
//    NSLog(@"%@--",navBar);
//    NSLog(@"%@",self.navigationBar);

    
    if (self.childViewControllers.count ==0) {
        self.navigationBar.hidden = YES;
    }
    
    [super pushViewController:viewController animated:animated];

}

@end

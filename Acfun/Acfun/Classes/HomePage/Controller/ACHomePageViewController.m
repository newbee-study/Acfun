//
//  ACHomePageViewController.m
//  Acfun
//
//  Created by 黄文伟 on 16/5/9.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import "ACHomePageViewController.h"
#import <Masonry.h>

@interface ACHomePageViewController ()

@end

@implementation ACHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBarItems];
      }

- (void)setUpRedView
{
//    UIView *headview = [[UIView alloc] init];
    UIView *headview = [[UIView alloc] initWithFrame:CGRectMake(0, -20, HScreenW, HScreenH/10.0)];
    
    [self.view addSubview:headview];
    
//    headview.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    
//    [headview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top);
//        make.leading.equalTo(self.view.mas_leading);
//        make.trailing.equalTo(self.view.mas_trailing);
////        make.height.offset(50);
//    }];
    
    
}

- (void)setUpNavBarItems
{
    //左侧logo
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage originImageWithName:@"logo_iPad"]] ];
    
   
    //右侧离线缓存
   UIBarButtonItem *downLoadBtn = [[UIBarButtonItem alloc ]initWithImage:[UIImage originImageWithName:@"nav_download"] style:UIBarButtonItemStyleDone target:self action:@selector(downLoad)];
    
    self.navigationItem.rightBarButtonItems = @[downLoadBtn];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

- (void)downLoad
{
    NSLog(@"缓存");

}

@end

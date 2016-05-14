//
//  ACHomePageViewController.m
//  Acfun
//
//  Created by 黄文伟 on 16/5/9.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import "ACHomePageViewController.h"
#import <Masonry.h>
#import "HomeSectionCell.h"
@interface ACHomePageViewController ()
@property (nonatomic,weak) UIView *refresh;
@property (nonatomic,assign) BOOL isRefreshing;

@end

@implementation ACHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeSectionCell" bundle:nil] forCellReuseIdentifier:SectionCell];
    [self setUpNavBarItems];
    [self setUpRefresh];
    [self setUpHeadView];
      }

#pragma mark ----设置UI界面控件
//设置UI界面控件
//设置导航条按钮
- (void)setUpNavBarItems
{
    //左侧logo
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage originImageWithName:@"login_logo"]];
    
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    
    imageV.frame = CGRectMake(0, 0, 167*0.5, 51*0.5);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView: imageV];
    
   
    //右侧离线缓存
//   UIBarButtonItem *downLoadBtn = [[UIBarButtonItem alloc ]initWithImage:[UIImage originImageWithName:@"home_navi_download"] style:UIBarButtonItemStyleDone target:self action:@selector(downLoad)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    UIBarButtonItem *downLoadBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btn setImage:[UIImage originImageWithName:@"home_navi_download"] forState:UIControlStateNormal];
    
    
    [btn setImage:[UIImage originImageWithName:@"home_navi_download_highlighted"] forState:UIControlStateHighlighted];
    
    btn.frame = CGRectMake(0, 0, 20,  20);
    
    //右侧历史记录
    UIButton *btnHistory = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    UIBarButtonItem *historyBtn = [[UIBarButtonItem alloc] initWithCustomView:btnHistory];
    [btnHistory setImage:[UIImage originImageWithName:@"home_navi_history"] forState:UIControlStateNormal];
    
    
    [btnHistory setImage:[UIImage originImageWithName:@"home_navi_history_highlighted"] forState:UIControlStateHighlighted];
    
    btnHistory.frame = CGRectMake(0, 0, 20,  20);
    
//   UIBarButtonItem *historyBtn = [[UIBarButtonItem alloc ]initWithImage:[UIImage originImageWithName:@"nav_history"] style:UIBarButtonItemStyleDone target:self action:@selector(history)];
    //右侧搜索
    UIButton *btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    UIBarButtonItem *searchBtn = [[UIBarButtonItem alloc] initWithCustomView:btnSearch];
    [btnSearch setImage:[UIImage originImageWithName:@"home_navi_search"] forState:UIControlStateNormal];
    
    
    [btnSearch setImage:[UIImage originImageWithName:@"home_navi_search_highlighted"] forState:UIControlStateHighlighted];
    
    btnSearch.frame = CGRectMake(0, 0, 20,  20);

//   UIBarButtonItem *searchBtn = [[UIBarButtonItem alloc ]initWithImage:[UIImage originImageWithName:@"search_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(search)];
    UIButton *placeHolderbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    UIBarButtonItem *phBtn = [[UIBarButtonItem alloc] initWithCustomView:placeHolderbtn];
//    [btn setImage:[UIImage originImageWithName:@"home_navi_download"] forState:UIControlStateNormal];
    
    
//    [btn setImage:[UIImage originImageWithName:@"home_navi_download_highlighted"] forState:UIControlStateHighlighted];
    
    placeHolderbtn.frame = CGRectMake(0, 0, 20,  20);
    
    self.navigationItem.rightBarButtonItems = @[searchBtn,phBtn,historyBtn,phBtn,downLoadBtn];

}
//设置刷新控件
- (void)setUpRefresh
{
    UIView *refresh = [[UIView alloc] initWithFrame:CGRectMake(0, -64, HScreenW, 64)];
    
    self.refresh = refresh;
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(HScreenW * 0.5, refresh.H_height * 0.5, refresh.H_width*0.25, refresh.H_height * 0.25)];
    
    textLabel.text = @"再拉刷新";
    
    [refresh addSubview:textLabel];
    
    
    refresh.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:refresh];

}
- (void)setUpHeadView
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HScreenW, _refresh.H_height *1.9)];
    
    headView.backgroundColor = [UIColor orangeColor];
    
    self.tableView.tableHeaderView = headView;

}

#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeSectionCell *cell = [tableView dequeueReusableCellWithIdentifier: SectionCell forIndexPath:indexPath];
    
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //顶部高度
    CGFloat top = 2 * HomeCellMargin + 28;
    
    CGFloat middle = 300;
    
    CGFloat bottom = 2 *HomeCellMargin + 18;
    
    return top + middle + bottom;

}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
#pragma mark - 刷新相关方法
- (void)updateRefreshView :(UIScrollView *)scrollView
{
    UILabel *label = self.refresh.subviews[0];
    //刷新状态下
    if (self.isRefreshing) {
        label.text = @"刷新ing";
    }else //非刷新状态下
    {

            if (scrollView.contentOffset.y <= -self.refresh.H_height -64)
            {
            
                label.text = @"松开刷新";
            }
            //未完全露出
            else
            {
                    label.text = @"再拉刷新";
            }
    }
}
//开始刷新
- (void)doRefresh
{
    self.isRefreshing = YES;
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self endRefresh];
    });
    
    NSLog(@"刷新ing");
}
//结束刷新
- (void)endRefresh
{
    self.isRefreshing = NO;
    [UIView animateWithDuration:.75 animations:^{
        self.tableView.contentInset = UIEdgeInsetsMake(64, 0,0, 0);

    }];

}
#pragma mark - ScrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //更新刷新控件文字等
    [self updateRefreshView:scrollView];


}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //完全露出刷新控件
    if (scrollView.contentOffset.y <= -self.refresh.H_height -64) {

        self.tableView.contentInset = UIEdgeInsetsMake(64 + 64, 0, 0, 0);
        

        [self doRefresh];
    }
    //未完全露出
    else
    {
        
    }
    

}
#pragma mark - 导航条按钮事件
//离线缓存
- (void)downLoad
{
    NSLog(@"缓存");
    
}
//历史记录
- (void)history
{
    NSLog(@"历史记录");
}
- (void)search
{
    NSLog(@"搜索");
}
@end

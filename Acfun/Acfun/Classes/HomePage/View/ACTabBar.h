//
//  ACTabBar.h
//  Acfun
//
//  Created by 黄文伟 on 16/5/13.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ACTabBarButton;
@protocol ACTabBarDelegate <NSObject>
@optional
- (void)ACTabBarClickButton:(ACTabBarButton *)button;

@end
@interface ACTabBar : UIView

@property (nonatomic,weak) id<ACTabBarDelegate> delegate;
@property (nonatomic,strong) NSMutableArray<UITabBarItem *> *items;
@end

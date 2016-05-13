//
//  ACTabBar.m
//  Acfun
//
//  Created by 黄文伟 on 16/5/13.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import "ACTabBar.h"
#import "ACTabBarButton.h"

@interface ACTabBar ()
@property (nonatomic,weak) ACTabBarButton *selectedButton;
@end


@implementation ACTabBar
//-(NSMutableArray *)items
//{
//    if (!_items) {
//        
//        _items = [NSMutableArray array];
//    }
//    return _items;
//}

- (void)setItems:(NSMutableArray *)items
{
    _items = items;
    
    [self setUpSubViews];

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    int i = 0;
    CGFloat width = self.H_width/ (self.items.count *1.0);
    
    CGFloat height = self.H_height;

    for (ACTabBarButton * btn in self.subviews) {
        
        
        btn.frame = CGRectMake(i * width, 0, width, height);
        
        i++;

    }

}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       
        self.backgroundColor = [UIColor whiteColor] ;
    }
    return self;
}
- (void)setUpSubViews
{
    
    for (int i = 0; i < self.items.count; i++) {
        
        UITabBarItem *item = _items[i];
        
      
        
        ACTabBarButton *btn = [ACTabBarButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:item.image forState:UIControlStateNormal];
        [btn setImage:item.selectedImage forState:UIControlStateSelected];
        [btn setTitle:item.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        btn.tag = i;
        [btn addTarget:self action:@selector(ClickButton:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [self ClickButton:btn];
        }
        
        [self addSubview:btn];
    }

}

- (void)ClickButton:(ACTabBarButton *)button
{
    self.selectedButton.selected = NO;
    
    button.selected = YES;
    
    [self.delegate ACTabBarClickButton:button];
    
    self.selectedButton = button;

}



@end

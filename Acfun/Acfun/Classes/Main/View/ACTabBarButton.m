//
//  ACTabBarButton.m
//  Acfun
//
//  Created by 黄文伟 on 16/5/13.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import "ACTabBarButton.h"
#import <Masonry.h>
@implementation ACTabBarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setHighlighted:(BOOL)highlighted
{

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = self.H_width;
    
    CGFloat height = self.H_height;
    
    CGFloat margin = 10;
    
    
//    self.imageView.H_centerX = self.H_width * 0.5;
//    self.imageView.H_y = margin;
//    self.imageView.H_width = self.imageView.H_width *0.5;
////    self.imageView.H_width = self.H_width *0.5;
//    self.imageView.H_height = self.imageView.H_height *0.5;
//    self.imageView.H_height = self.H_height *0.5;
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(5);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(self.mas_height).multipliedBy(0.5);
        make.width.equalTo(self.mas_height).multipliedBy(0.5*67/41);
    
    }];
    
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = CGRectMake((self.H_width - self.titleLabel.H_width) * 0.5, self.H_height * 0.6, self.titleLabel.H_width, self.titleLabel.H_height);
    
//    self.titleLabel.H_centerX = self.imageView.H_centerX;
//    
//    self.titleLabel.H_y = self.imageView.H_y + 20;
//    

//    [self.titleLabel sizeToFit];
    
//    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.centerX.equalTo(self.imageView.mas_leading);
////        make.top.equalTo(self.imageView.mas_bottom).offset(15);
//        make.leading.equalTo(self.mas_leading);
//        make.trailing.equalTo(self.mas_trailing);
//        make.bottom.equalTo(self.mas_bottom);
//        
//    }];
//    [self.titleLabel layoutIfNeeded];
  
//    NSLog(@"%@",NSStringFromCGRect(self.frame));

}
@end

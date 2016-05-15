//
//  UIView+frame.m
//  BaiSi
//
//  Created by 黄文伟 on 16/4/5.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)

- (CGFloat)H_centerX
{
    return self.center.x;
}
-(CGFloat)H_centerY
{
    return self.center.y;
}
- (CGFloat)H_height
{
    return self.frame.size.height;
}
- (CGFloat)H_width
{
    return self.frame.size.width;
}
- (CGFloat)H_x
{
    return self.frame.origin.x;
}
- (CGFloat)H_y
{
    return self.frame.origin.y;
}
-(void)setH_centerX:(CGFloat)H_centerX
{
    CGPoint center = self.center;
    center.x = H_centerX;
    self.center = center;

}
- (void)setH_centerY:(CGFloat)H_centerY
{
    CGPoint center = self.center;
    center.y = H_centerY;
    self.center = center;
}
- (void)setH_height:(CGFloat)H_height
{
    CGRect frame = self.frame;
    
    frame.size.height = H_height;
    
    self.frame = frame;

}
-(void)setH_width:(CGFloat)H_width
{
    CGRect frame = self.frame;
    
    frame.size.width = H_width;
    
    self.frame = frame;
}
-(void)setH_x:(CGFloat)H_x
{
    CGRect frame = self.frame;
    
    frame.origin.x = H_x;
    
    self.frame = frame;
}
- (void)setH_y:(CGFloat)H_y
{
    CGRect frame = self.frame;
    
    frame.origin.y = H_y;
    
    self.frame = frame;
}

@end

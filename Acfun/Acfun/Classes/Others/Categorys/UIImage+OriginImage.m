//
//  UIImage+OriginImage.m
//  Acfun
//
//  Created by 黄文伟 on 16/5/10.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import "UIImage+OriginImage.h"

@implementation UIImage (OriginImage)

+ (UIImage *)originImageWithName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
}
@end

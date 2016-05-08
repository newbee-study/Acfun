//
//  ViewController.m
//  Acfun
//
//  Created by 黄文伟 on 16/5/7.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    
    NSDictionary *paras = [NSDictionary dictionary];
    
    /*
     app_version	4.1.8
     client_id	yU3geLTsD8vriBzy
     market	appstore
     origin	ios
     password	506869474
     resolution	640x1136
     response_type	token
     sys_name	ios
     sys_version	9.3.1
     username	Destiny-false.541@qq.com
     */
    paras = @{
              @"app_version" : @"4.1.8",
              @"client_id" : @"yU3geLTsD8vriBzy",
              @"market" : @"appstore",
              @"origin" : @"ios",
              @"password" : @"506869474",
              @"resolution" : @"640x1136",
              @"response_type" : @"token",
              @"sys_name" : @"ios",
              @"sys_version" : @"9.3.1",
              @"username" :@"Destiny-false.541@qq.com"
              
              };
    
    [manage POST:@"http://mobile.acfun.tv/oauth2/authorize2.aspx" parameters:paras progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSDictionary *dict = responseObject;
        
        NSLog(@"111");
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"000");
    }
     ] ;

}



@end

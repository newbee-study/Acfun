//
//  ACNetWorkingTool.m
//  Acfun
//
//  Created by 黄文伟 on 16/5/14.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import "ACNetWorkingTool.h"
#import "AFNetworking.h"
@interface ACNetWorkingTool ()
@property (nonatomic,strong) AFHTTPSessionManager * manager;
@end

@implementation ACNetWorkingTool
-(AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

+(instancetype)sharedManager
{
    static ACNetWorkingTool*sharedMyManager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedMyManager = [[self alloc] init];
        
    });
    
    return sharedMyManager;
}

- (void)Get:(NSString *)url parameters:(id)prarameters downloadProcess:(void (^)(NSProgress * downloadProcess))downloadProcess success:(void (^)(NSURLSessionDataTask * task ,id responseObject))success failure :(void (^)(NSURLSessionDataTask *task ,NSError *error))failure
{
 
    [self.manager GET:url parameters:prarameters progress:downloadProcess success:success failure:failure];
    
}

- (void)Post :(NSString *)url parameters:(id)parameters progress:(void(^)(NSProgress *uploadProgress))uploadProgress success:(void(^)(NSURLSessionDataTask *task , id responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    [self.manager POST:url parameters:parameters progress:uploadProgress success:success failure:failure];
    
    }
//下载
- (void)Download :(NSString *)url progress:(void(^)(NSProgress * downloadProgress))downloadProgress destination:(NSURL *(^)(NSURL *targetPath,NSURLResponse *responce)) destination comletionHandler:(void(^)(NSURLResponse *responce,NSURL *filePath,NSError *error))comletionHandler
{
   
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.manager downloadTaskWithRequest:request progress:downloadProgress destination:destination completionHandler:comletionHandler
     ];
    
}
//断点下载
-(void)Download2
{

//    self.manager downloadTaskWithResumeData:<#(nonnull NSData *)#> progress:<#^(NSProgress * _Nonnull downloadProgress)downloadProgressBlock#> destination:<#^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response)destination#> completionHandler:<#^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error)completionHandler#>


}
@end

//
//  ACNetWorkingTool.h
//  Acfun
//
//  Created by 黄文伟 on 16/5/14.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACNetWorkingTool : NSObject
+(instancetype)sharedManager;
- (void)Get:(NSString *)url parameters:(id)prarameters downloadProcess:(void (^)(NSProgress * downloadProcess))downloadProcess success:(void (^)(NSURLSessionDataTask * task ,id responseObject))success failure :(void (^)(NSURLSessionDataTask *task ,NSError *error))failure;

- (void)Post :(NSString *)url parameters:(id)parameters progress:(void(^)(NSProgress *uploadProgress))uploadProgress success:(void(^)(NSURLSessionDataTask *task , id responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;
@end

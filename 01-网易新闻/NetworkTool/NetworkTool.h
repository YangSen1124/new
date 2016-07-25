//
//  NetworkTool.h
//  01-网易新闻
//
//  Created by 杨森 on 16/7/19.
//  Copyright © 2016年 杨森. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface NetworkTool : AFHTTPSessionManager

+ (instancetype)sharedNetworkTool;

@end

//
//  NewsModel.m
//  01-网易新闻
//
//  Created by 杨森 on 16/7/21.
//  Copyright © 2016年 杨森. All rights reserved.
//

#import "NewsModel.h"
#import "NetworkTool.h"

@implementation NewsModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

+(instancetype)NewsModelWithDic:(NSDictionary *)dic
{
    NewsModel *model = [[NewsModel alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}


+(void)downloadWithUrlstr:(NSString *)urlstr successBlock:(void (^)(NSArray *))successBlock failureBlock:(void (^)(NSError *))failureBlock{
    
    [[NetworkTool sharedNetworkTool]GET:urlstr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary  *dic = responseObject;
        NSString *key = dic.keyEnumerator.nextObject;
        
        NSArray *arr = [dic objectForKey:key];
        
        //可变数组
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
        
        //遍历arr
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NewsModel *model = [self NewsModelWithDic:obj];
            [arrM addObject:model];
            
        }];
        if(successBlock){
            successBlock(arrM.copy);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failureBlock){
            failureBlock(error);
        }
        
        
        
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}



@end

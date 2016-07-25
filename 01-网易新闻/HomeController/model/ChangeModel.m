//
//  ChangeModel.m
//  01-网易新闻
//
//  Created by 杨森 on 16/7/19.
//  Copyright © 2016年 杨森. All rights reserved.
//

#import "ChangeModel.h"

@implementation ChangeModel


- (NSString *)description{
    
    return [NSString stringWithFormat:@"%@  %@",_tid,_tname];
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

+ (instancetype)channelWithDic:(NSDictionary *)dic{
    
    ChangeModel *model = [[ChangeModel alloc] init];
    
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}




+ (NSArray *)channels{
    
    //获取标签JSON文件路径
    NSString *JSONPath = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    
    //通过路径获取JSON文件二进制
    NSData *JSONData = [NSData dataWithContentsOfFile:JSONPath];
    
    //反序列化
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:NULL];
    
    //取出根节点下的数组
    NSArray *arr = [rootDict objectForKey:@"tList"];
    
    //可变数组
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
    
    //遍历数组
    [arr enumerateObjectsUsingBlock:^(NSDictionary  *obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        //获取model
        ChangeModel *model = [self channelWithDic:obj];
        
        //把model 添加到可变的数组
        [arrM addObject:model];
        
    }];
    
    //排序
    [arrM sortUsingComparator:^NSComparisonResult(ChangeModel * obj1, ChangeModel * obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
    
    return arrM.copy;
}


@end

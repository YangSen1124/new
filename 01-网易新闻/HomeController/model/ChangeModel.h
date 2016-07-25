//
//  ChangeModel.h
//  01-网易新闻
//
//  Created by 杨森 on 16/7/19.
//  Copyright © 2016年 杨森. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChangeModel : NSObject

//频道标签名
@property (nonatomic, copy) NSString *tname;

//频道标签ID
@property (nonatomic, copy) NSString *tid;


//频道模型自己获取频道标签模型数据  返回模型数据
+ (NSArray *)channels;



@end

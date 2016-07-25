//
//  CycleModel.h
//  01-网易新闻
//
//  Created by 杨森 on 16/7/22.
//  Copyright © 2016年 杨森. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CycleModel : NSObject

//轮播图标题
@property (nonatomic, copy) NSString *title;

//轮播图片
@property (nonatomic, copy) NSString *imgsrc;


//下载方法
+(void)loadCycleDataWithUrlstr:(NSString *)urlstr successBlock:(void(^)(NSArray *listArr))successBlock failBlock:(void(^)(NSError *error))failBlock;

@end

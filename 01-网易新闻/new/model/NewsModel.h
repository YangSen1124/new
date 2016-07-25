//
//  NewsModel.h
//  01-网易新闻
//
//  Created by 杨森 on 16/7/21.
//  Copyright © 2016年 杨森. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject


/// 新闻标题
@property (nonatomic,copy) NSString *title;
/// 新闻图标
@property (nonatomic,copy) NSString *imgsrc;
/// 新闻来源
@property (nonatomic,copy) NSString *source;
/// 新闻回复数
@property (nonatomic,strong) NSNumber *replyCount;
/// 多张配图
@property (nonatomic, strong) NSArray *imgextra;
/// 大图标记
@property (nonatomic, assign) BOOL imgType;

+ (void)downloadWithUrlstr:(NSString *)urlstr successBlock:(void(^)(NSArray *arr))successBlock failureBlock:(void(^)(NSError *error))failureBlock;


@end

//
//  HomeCollectionViewCell.m
//  01-网易新闻
//
//  Created by 杨森 on 16/7/19.
//  Copyright © 2016年 杨森. All rights reserved.
//

#import "HomeCollectionViewCell.h"

#import "newViewController.h"

@interface HomeCollectionViewCell ()

@property (strong, nonatomic) newViewController *newsVC;


@end

@implementation HomeCollectionViewCell

/**
 这个方法在initWithCoder后执行
 当视图被唤醒(完全加载出来)调用的,在这个方法里面完全可以拿到视图的正确的frame
 */
- (void)awakeFromNib{
    
   //创建NewtableViewController
    UIStoryboard *newsStoryboard = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    self.newsVC = [newsStoryboard instantiateInitialViewController];
    

    //设置frame
    self.newsVC.tableView.frame = self.contentView.bounds;
    
    [self addSubview:self.newsVC.tableView];
    
}
//重写主页传入的URLString 的setter的方法
- (void)setURLString:(NSString *)URLString{
    
    
    _URLString = URLString;
    
    self.newsVC.URLString = URLString;
    
}





@end

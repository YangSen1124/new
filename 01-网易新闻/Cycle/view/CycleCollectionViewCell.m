//
//  CycleCollectionViewCell.m
//  01-网易新闻
//
//  Created by 杨森 on 16/7/22.
//  Copyright © 2016年 杨森. All rights reserved.
//

#import "CycleCollectionViewCell.h"
#import <UIImageView+WebCache.h>

@interface CycleCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;




@end


@implementation CycleCollectionViewCell

- (void)setModel:(CycleModel *)model{
    
    _model = model;
    
    //轮播图图片
    [self.imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    
    //轮播图title
    self.titleLab.text = model.title;
    
        
}







@end

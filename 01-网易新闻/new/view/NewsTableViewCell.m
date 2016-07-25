//
//  NewsTableViewCell.m
//  01-网易新闻
//
//  Created by 杨森 on 16/7/21.
//  Copyright © 2016年 杨森. All rights reserved.
//

#import "NewsTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface NewsTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;

@property (weak, nonatomic) IBOutlet UILabel *TitleLab;

@property (weak, nonatomic) IBOutlet UILabel *sourceLab;

@property (weak, nonatomic) IBOutlet UILabel *replyLab;

@property (strong, nonatomic) IBOutletCollection (UIImageView)NSArray * imgtex;
@end



@implementation NewsTableViewCell

- (void)setModel:(NewsModel *)model{

    _model = model;
    [self.imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    self.TitleLab.text = model.title;
    self.sourceLab.text = model.source;
    self.replyLab.text = [NSString stringWithFormat:@"%@",model.replyCount];
    //遍历多图cell图片
    for (int i = 0; i < model.imgextra.count; i++) {
        //取出控件
        UIImageView *img = self.imgtex[i];
        
        NSDictionary *dic = model.imgextra[i];
        
        NSString *imgsrc = [dic objectForKey:@"imgsrc"];
        //给控件赋值
        [img sd_setImageWithURL:[NSURL URLWithString:imgsrc]];
        
    }
    
    
    
    
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

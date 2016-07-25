//
//  newViewController.m
//  01-网易新闻
//
//  Created by 杨森 on 16/7/19.
//  Copyright © 2016年 杨森. All rights reserved.
//

#import "newViewController.h"
#import "NewsModel.h"
#import "NewsTableViewCell.h"
@interface newViewController ()

//数据源数组
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation newViewController

-(void)setURLString:(NSString *)URLString{
    
    [NewsModel downloadWithUrlstr:URLString successBlock:^(NSArray *arr) {
        //给dataArr 赋值
        self.dataArr = arr;
        
        [self.tableView reloadData];
        
    } failureBlock:^(NSError *error) {
    
    }];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
  
}



#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsModel *model = self.dataArr[indexPath.row];
    
    NSString *ID;
    //判断是否为大图
    if(model.imgType){
        
       ID = @"BigCell";
    }
    else if(model.imgextra.count == 2){
        
        ID =@"ImagesCell";
    }else{
        
        ID = @"BaseCell";
    }
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
 
    
    cell.model = model;
    
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsModel *model = self.dataArr[indexPath.row];
    
    if (model.imgType) {
        return 180;
    }else if(model.imgextra.count == 2){
        
        return 160;
    }
    else{
        return 80;
    }
    
    
}







@end

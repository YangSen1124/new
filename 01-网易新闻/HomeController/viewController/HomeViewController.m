//
//  HomeViewController.m
//  01-网易新闻
//
//  Created by 杨森 on 16/7/19.
//  Copyright © 2016年 杨森. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"
#import "ChangeModel.h"
#import "channelLab.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *contentCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (weak, nonatomic) IBOutlet UIScrollView *ChannelScrollView;

//数据接收
@property (strong, nonatomic) NSArray *dataArr;
//标签数组
@property (strong, nonatomic) NSMutableArray *labM;

@end

@implementation HomeViewController
- (NSMutableArray *)labM{
    if(_labM == nil){
        
        _labM = [NSMutableArray array];
        
    }
    
    return _labM;

}

- (NSArray *)dataArr{
    
    if(_dataArr == nil){
        _dataArr = [ChangeModel channels];
    }
    
    return _dataArr;
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
  self.flowLayout.itemSize = self.contentCollectionView.bounds.size;  
    
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置水平滑动
    self.flowLayout.scrollDirection =UICollectionViewScrollDirectionHorizontal;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //分页
    self.contentCollectionView.pagingEnabled = YES;
    //间距
    self.flowLayout.minimumLineSpacing = 0;
    
    [self creatChannelLab];
    
}

- (void)creatChannelLab{
    
    int LabW = 80;
    int labH = self.ChannelScrollView.bounds.size.height;
    
    for (int i = 0; i < self.dataArr.count; i++) {
        
        channelLab *lab = [[channelLab alloc] init];
        //给lab设置frame
        lab.frame = CGRectMake(LabW * i, 0, LabW, labH);
        
        //获取model
        ChangeModel *model = self.dataArr[i];
        
        lab.text = model.tname;
          //lab.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        
        //给lab设置tag
        lab.tag = i;
        
        [self.ChannelScrollView addSubview:lab];
        
        //设置ChannelScrollView滚动
        self.ChannelScrollView.contentSize = CGSizeMake(LabW *self.dataArr.count, 0);
        
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        
        [lab addGestureRecognizer:tap];
        
        //设置lab可以点击
        lab.userInteractionEnabled = YES;
        
        
        //添加lab到数组
        [self.labM addObject:lab];
        
    }
    
    
    
}

//点击频道的方法
- (void)tapClick:(UIGestureRecognizer *)tap{
    
    //获取选中的lab
    channelLab *lab =  (channelLab *) tap.view;
    
    // 计算选中的label剧中时,要滚动的偏移量
    CGFloat labOffsetX = lab.center.x - self.view.bounds.size.width/2;
    
    //限制最大和最小的偏移量
    CGFloat minOffsetX= 0;
    CGFloat maxOffsetX= self.ChannelScrollView.contentSize.width - self.view.bounds.size.width;
    
    if (labOffsetX < minOffsetX){
        labOffsetX = 0;
    }else if (labOffsetX > maxOffsetX){
        
        labOffsetX = maxOffsetX;
        
    }
    // 设置频道滚动视图的滚动
    [self.ChannelScrollView setContentOffset:CGPointMake(labOffsetX, 0) animated:YES];
    
#pragma mark - 点击频道标签居中时,collectionView也跟着联动
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:lab.tag inSection:0];
    [self.contentCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:YES];
    
}

#pragma mark - 监听底部conllectionView的滚动 : 滚动结束的代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //计算滚动到第几个索引
    NSInteger index = scrollView.contentOffset.x/scrollView.bounds.size.width;
    //根据标签找lab
    channelLab *lab = self.labM[index];
    
    
    //lab滚动的偏移量
    CGFloat labOffSetX = lab.center.x - self.view.bounds.size.width/2;
    
    //限制最大和最小的偏移量
    CGFloat minOffSetX = 0;
    CGFloat maxOffSetX = self.ChannelScrollView.contentSize.width - self.view.bounds.size.width;
    
    if (labOffSetX < minOffSetX){
        
        labOffSetX = 0;
    }else if (labOffSetX > maxOffSetX){
        
        labOffSetX = maxOffSetX;
    }
    
    //设置频道滚动视图的滚动
    [self.ChannelScrollView setContentOffset:CGPointMake(labOffSetX, 0) animated:YES];
    
    
    
}




#pragma mark CollectionView数据源方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionCell" forIndexPath:indexPath];
    
    ChangeModel *model = self.dataArr[indexPath.row];
    
    NSString *urlstr = [NSString stringWithFormat:@"article/list/%@/0-20.html",model.tid];
    cell.URLString = urlstr;
    
    
    
    return cell;
}

@end

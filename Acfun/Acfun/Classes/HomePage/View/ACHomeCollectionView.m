//
//  ACHomeCollectionView.m
//  Acfun
//
//  Created by 黄文伟 on 16/5/11.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import "ACHomeCollectionView.h"
#import "HomeVedioCell.h"
#import <Masonry.h>

@interface ACHomeCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,weak) UICollectionView *collectionV;



@end

@implementation ACHomeCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
     
        [self setUpCollectionView];
        
    }
    return nil;
}

- (void)awakeFromNib
{
    [self setUpCollectionView];

}

- (void)setUpCollectionView
{

    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];

//    flow.minimumInteritemSpacing = 0;
//    flow.minimumLineSpacing = HomeCellMargin;
//    flow.minimumLineSpacing = 0;
    
    
    UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flow];
    collectionV.backgroundColor = [UIColor whiteColor];
    collectionV.showsVerticalScrollIndicator = NO;
    collectionV.showsHorizontalScrollIndicator = NO;
//    collectionV.contentSize = CGSizeMake(0, 0);
    collectionV.scrollEnabled = NO;
    [self addSubview:collectionV];

    
    [collectionV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.leading.equalTo(self.mas_leading);
        make.trailing.equalTo(self.mas_trailing);
    }];
    [self sizeToFit];
    //每个Item的尺寸
    CGFloat width = (self.H_width )*1.0/2.0;
//    CGFloat height = self.H_height *1.0/2.0;
    CGFloat height = 120;
    flow.itemSize = CGSizeMake(width, height);
    
    self.collectionV = collectionV;
    collectionV.delegate = self;
    
    collectionV.dataSource = self;
    
    [collectionV registerNib:[UINib nibWithNibName:@"HomeVedioCell" bundle:nil] forCellWithReuseIdentifier:HomeCollectionPlayCell];
    

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeVedioCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HomeCollectionPlayCell forIndexPath:indexPath];
    
    return cell;

}
@end

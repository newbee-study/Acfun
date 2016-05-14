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
    flow.minimumInteritemSpacing = HomeCellMargin;
    CGFloat width = (self.H_width - HomeCellMargin*4)*1.0/2;
    flow.minimumLineSpacing = HomeCellMargin;
    flow.minimumInteritemSpacing = HomeCellMargin;
    flow.itemSize = CGSizeMake(width, 90);
    
    
    UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flow];
    [self addSubview:collectionV];

    
    [collectionV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.leading.equalTo(self.mas_leading);
        make.trailing.equalTo(self.mas_trailing);
    }];
    
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

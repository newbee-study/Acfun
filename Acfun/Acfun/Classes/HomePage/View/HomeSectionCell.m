//
//  HomeSectionCell.m
//  Acfun
//
//  Created by 黄文伟 on 16/5/11.
//  Copyright © 2016年 黄文伟. All rights reserved.
//

#import "HomeSectionCell.h"
#import "ACHomeCollectionView.h"
@interface HomeSectionCell()

@property (weak, nonatomic) IBOutlet ACHomeCollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *moreContentButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end


@implementation HomeSectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

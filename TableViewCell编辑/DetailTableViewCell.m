//
//  DetailTableViewCell.m
//  TableViewCell编辑
//
//  Created by Liyu on 16/8/18.
//  Copyright © 2016年 liyu. All rights reserved.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.headImage.layer.cornerRadius = 20;
    self.headImage.layer.masksToBounds = YES;
    self.nameLabel.textColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

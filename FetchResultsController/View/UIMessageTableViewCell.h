//
//  UIMessageTableViewCell.h
//  FetchResultsController
//
//  Created by wangwenbing on 2017/4/6.
//  Copyright © 2017年 Centit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIMessageTableViewCell : UITableViewCell


@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UILabel *nickNameLabel;



+ (instancetype)cellWithTableView:(UITableView *)tableView  atBird:(Bird *)bird;

@end

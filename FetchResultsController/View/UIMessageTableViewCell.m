//
//  UIMessageTableViewCell.m
//  FetchResultsController
//
//  Created by wangwenbing on 2017/4/6.
//  Copyright © 2017年 Centit. All rights reserved.
//

#import "UIMessageTableViewCell.h"

@implementation UIMessageTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView  atBird:(Bird *)bird
{
    static NSString *identifier = @"UIMessageTableViewCell";
    UIMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.nickNameLabel.text = bird.fly;
    cell.contentLabel.text = bird.feed;
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialBind];
    }
    return self;
}

- (void)initialBind
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 50,50)];
    imageView.backgroundColor = [UIColor yellowColor];
    [self addSubview:imageView];
    
    UILabel *neckNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + 10, 5, 100,20)];
    [self addSubview:neckNameLabel];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + 10, CGRectGetMaxY(neckNameLabel.frame) + 10, 150, 20)];
    
    [self addSubview:contentLabel];
    
    self.iconImageView = imageView;
    self.nickNameLabel = neckNameLabel;
    self.contentLabel = contentLabel;
}

- (void)layoutSubviews
{
    
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

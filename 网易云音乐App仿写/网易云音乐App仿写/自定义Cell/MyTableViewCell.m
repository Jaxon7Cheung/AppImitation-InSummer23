//
//  MyTableViewCell.m
//  网易云音乐App仿写
//
//  Created by 张旭洋 on 2023/7/24.
//

#import "MyTableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString: @"segmentTable"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"sandian.png"]];
    }


    [self.contentView addSubview: self.iView];
    return self;
}

#pragma mark 😳😳😳😳😳😳😳😳😳
- (void)layoutSubviews {
//    self.label.frame = CGRectMake(77, 22, 100, 50);
//    self.detailTextLabel.frame = CGRectMake(77, 44, 100, 50);
    self.iView.frame = CGRectMake(WIDTH - 80, 33, 25, 25);
    [super layoutSubviews];
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

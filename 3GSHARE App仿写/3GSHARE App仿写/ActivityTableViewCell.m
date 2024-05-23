//
//  ActivityTableViewCell.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/29.
//

#import "ActivityTableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation ActivityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    self.label = [[UILabel alloc] init];
    self.label.font = [UIFont boldSystemFontOfSize: 13];
    
    
    
    if ([self.reuseIdentifier isEqualToString: @"activity1"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"huodong1.png"]];
        self.label.text = @"下厨也要美美哒，从一条围裙开始-六月鲜围裙创意设计大赛";
    } else if ([self.reuseIdentifier isEqualToString: @"activity2"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"huodong2.png"]];
        self.label.text = @"MIUI主题市场让你的创意改变世界！";
    } else if ([self.reuseIdentifier isEqualToString: @"activity3"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"huodong3.png"]];
        self.label.text = @"HUAWEI赛";
    }
    
    [self.contentView addSubview: self.iView];
    [self.contentView addSubview: self.label];
    return self;
}

- (void)layoutSubviews {
    self.iView.frame = CGRectMake(0, 0, 370, 190);
    self.label.frame = CGRectMake(15, 165, 370, 100);
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

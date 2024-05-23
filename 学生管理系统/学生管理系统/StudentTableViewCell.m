//
//  StudentTableViewCell.m
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import "StudentTableViewCell.h"

@implementation StudentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString: @"cellID"]) {
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont boldSystemFontOfSize: 18];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.classLabel = [[UILabel alloc] init];
        self.classLabel.textColor = [UIColor whiteColor];
        self.classLabel.font = [UIFont boldSystemFontOfSize: 18];
        self.classLabel.textAlignment = NSTextAlignmentCenter;
        self.numberLabel = [[UILabel alloc] init];
        self.numberLabel.textColor = [UIColor whiteColor];
        self.numberLabel.font = [UIFont boldSystemFontOfSize: 18];
        self.numberLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    [self.contentView addSubview: self.nameLabel];
    [self.contentView addSubview: self.classLabel];
    [self.contentView addSubview: self.numberLabel];
    
    return self;
}

- (void)layoutSubviews {
    self.nameLabel.frame = CGRectMake(40, 10, 100, 50);
    self.classLabel.frame = CGRectMake(150, 10, 100, 50);
    self.numberLabel.frame = CGRectMake(275, 10, 100, 50);
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

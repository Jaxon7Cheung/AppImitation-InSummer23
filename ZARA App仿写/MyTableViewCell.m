//
//  MyTableViewCell.m
//  ZARA App仿写
//
//  Created by 张旭洋 on 2023/7/20.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString: @"Cell"]) {
        NSString* str = [NSString stringWithFormat: @"jiantouyou.png"];
        UIImage* image = [UIImage imageNamed: str];
        self.iView = [[UIImageView alloc] init];
        self.iView.image = image;
        self.iView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 25, 25, 10, 10);
    }
//    } else if ([self.reuseIdentifier isEqualToString: @"Cell01"]) {
//        NSString* str = [NSString stringWithFormat: @"jiantouyou.png"];
//        UIImage* image = [UIImage imageNamed: str];
//        self.iView = [[UIImageView alloc] init];
//        self.iView.image = image;
//        self.iView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 25, 25, 10, 10);
//    }
    
    [self.contentView addSubview: self.label];
    [self.contentView addSubview: self.iView];
    
    return self;
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

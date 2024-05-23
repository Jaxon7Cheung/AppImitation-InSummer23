//
//  SearchTableViewCell.m
//  天气预报App仿写
//
//  Created by . on 2023/8/2.
//

#import "SearchTableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@implementation SearchTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString: @"search"]) {
        self.label = [[UILabel alloc] init];
        self.label.textColor = [UIColor whiteColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont systemFontOfSize: 20];
    }
    [self.contentView addSubview: self.label];
    return self;
}

- (void)layoutSubviews {
    self.label.frame = CGRectMake(0, self.contentView.bounds.size.height / 2 - 33, WIDTH, 66);
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

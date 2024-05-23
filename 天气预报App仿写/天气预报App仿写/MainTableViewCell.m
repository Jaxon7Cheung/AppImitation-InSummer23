//
//  MainTableViewCell.m
//  天气预报App仿写
//
//  Created by . on 2023/8/2.
//

#import "MainTableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@implementation MainTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString: @"main"]) {
        self.iView = [[UIImageView alloc] init];
        self.cityLabel = [[UILabel alloc] init];
        self.cityLabel.textColor = [UIColor whiteColor];
        self.cityLabel.font = [UIFont boldSystemFontOfSize: 45];
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize: 32];
        self.timeLabel.textColor = [UIColor whiteColor];
    }
    
    [self.contentView addSubview: self.iView];
    [self.contentView addSubview: self.cityLabel];
    [self.contentView addSubview: self.timeLabel];
    self.contentView.layer.cornerRadius = 18.0;
    self.contentView.layer.masksToBounds = YES;
    
    return self;
}

- (void)layoutSubviews {
    self.iView.frame = self.contentView.bounds;//;
    self.cityLabel.frame = CGRectMake(15, self.contentView.bounds.size.height / 2 - 33, 555, 66);
    self.timeLabel.frame = CGRectMake(WIDTH - 110, self.contentView.bounds.size.height / 2 - 27, 100, 54);
    
    
    
    //[super layoutSubviews];
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

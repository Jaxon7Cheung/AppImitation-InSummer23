//
//  BasicInformationTableViewCell.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/30.
//

#import "BasicInformationTableViewCell.h"

@implementation BasicInformationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"basic"]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.tipLabel = [[UILabel alloc] init];
        self.tipLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview: self.tipLabel];
        
        self.detailLabel = [[UILabel alloc] init];
        self.detailLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview: self.detailLabel];
        
        self.deleteLabel = [[UILabel alloc] init];
        self.deleteLabel.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview: self.deleteLabel];
    }
    return self;
}

- (void)layoutSubviews {
    self.tipLabel.frame = CGRectMake(20, 15, 40, 30);
    self.detailLabel.frame = CGRectMake(100, 15, 270, 30);
    self.deleteLabel.frame = CGRectMake(10, 60, [UIScreen mainScreen].bounds.size.width - 20, 1);
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

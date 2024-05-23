//
//  NewSubscribeTableViewCell.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/30.
//

#import "NewSubscribeTableViewCell.h"

@implementation NewSubscribeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString: @"subscribe"]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.elseHeadPhotoImageView = [[UIImageView alloc] init];
        [self.contentView addSubview: self.elseHeadPhotoImageView];
    
        self.elseNameLabel = [[UILabel alloc] init];
        self.elseNameLabel.textColor = [UIColor blackColor];
        self.elseNameLabel.font = [UIFont systemFontOfSize:21];
        [self.contentView addSubview: self.elseNameLabel];
        
        self.deleteLabel = [[UILabel alloc] init];
        self.deleteLabel.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview: self.deleteLabel];
        
        self.subcribeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.subcribeButton setImage: [UIImage imageNamed: @"guanzhu_normal.png"] forState: UIControlStateNormal];
        [self.subcribeButton setImage: [UIImage imageNamed: @"guanzhu_pressed.png"] forState: UIControlStateSelected];
        [self.subcribeButton addTarget: self action: @selector(pressSubcribeButton:) forControlEvents: UIControlEventTouchUpInside];
        self.subcribeButton.selected = NO;
        [self.contentView addSubview: self.subcribeButton];
    }
    return self;

}

- (void)layoutSubviews {
    self.elseHeadPhotoImageView.frame = CGRectMake(10, 5, 80, 80);
    self.elseNameLabel.frame = CGRectMake(118, 28, 110, 35);
    self.subcribeButton.frame = CGRectMake(280, 35, 75, 30);
    self.deleteLabel.frame = CGRectMake(10, 93, [UIScreen mainScreen].bounds.size.width - 20, 1);
}

- (void)pressSubcribeButton:(UIButton*) button {
    if (button.selected == NO) {
        button.selected = YES;
    } else if (button.selected == YES) {
        button.selected = NO;
    }
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

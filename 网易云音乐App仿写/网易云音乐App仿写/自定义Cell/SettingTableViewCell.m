//
//  SettingTableViewCell.m
//  网易云音乐App仿写
//
//  Created by 张旭洋 on 2023/7/25.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString: @"heijiao"]) {
        self.imageVieww = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"heijiao.jpg"]];
        
    } else if ([self.reuseIdentifier isEqualToString: @"hongdian"]) {
        self.imageViewh = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"hongdian.png"]];
        
    } else if ([self.reuseIdentifier isEqualToString: @"night"]) {
        if (!self.nightSwitch) {
            self.nightSwitch = [[UISwitch alloc] init];
            [self.nightSwitch setThumbTintColor: [UIColor redColor]];
            [self.nightSwitch setOnTintColor: [UIColor colorWithRed: 233.0 / 255 green: 93.0 / 255 blue: 90.0 / 255 alpha: 1.0]];
            [self.nightSwitch addTarget: self action: @selector(pressNight:) forControlEvents: UIControlEventValueChanged];
        }
    }
    
    
    [self.contentView addSubview: self.imageVieww];
    [self.contentView addSubview: self.imageViewh];
    [self.contentView addSubview: self.nightSwitch];
//    self.contentView.layer.cornerRadius = 9;
//    self.contentView.layer.masksToBounds = YES;
    
    return self;
}

#pragma mark 😳😳😳😳😳😳😳😳😳
- (void)layoutSubviews {
    self.imageVieww.frame = self.contentView.bounds;
    self.imageViewh.frame = CGRectMake(self.contentView.bounds.size.width - 33, 22, 19, 19);
    self.nightSwitch.frame = CGRectMake(self.contentView.bounds.size.width - 99, 18, 32, 32);
    [super layoutSubviews];
}

- (void)pressNight: (UISwitch *)sw {
    if (sw.on == NO) {
        
    } else {
        
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

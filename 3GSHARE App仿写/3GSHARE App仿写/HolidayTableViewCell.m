//
//  HolidayTableViewCell.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/28.
//

#import "HolidayTableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@implementation HolidayTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    
    self.mainLabel = [[UILabel alloc] init];
    self.mainLabel.font = [UIFont boldSystemFontOfSize: 19];
    self.mainLabel.numberOfLines = 2;
    self.writerLabel = [[UILabel alloc] init];
    self.writerLabel.font = [UIFont boldSystemFontOfSize: 15];
    self.writerLabel.textColor = [UIColor darkGrayColor];
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont boldSystemFontOfSize: 13];
    self.timeLabel.textColor = [UIColor grayColor];
    
    

    self.viewingIcon = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"guankan.png"]];
    self.shareIcon = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"fenxiang.png"]];
    
    if ([self.reuseIdentifier isEqualToString: @"holidayPage"]) {
        self.headShot = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"headShot.png"]];
        self.mainLabel.text = @"假日";
        self.writerLabel.text = @"SHARE 小白";
        self.timeLabel.text = @"15分钟前";

        
    } else if ([self.reuseIdentifier isEqualToString: @"hP"]) {
        self.worksView1 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"works_img1"]];
        self.worksView2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"works_img2"]];
        self.worksView3 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"works_img3"]];
        self.worksView4 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"works_img4"]];
        self.artLabel = [[UILabel alloc] init];
        self.artLabel.text = @"多希望列车能我带到有你的城市。";
    }
    
    [self.contentView addSubview: self.headShot];
    [self.contentView addSubview: self.mainLabel];
    [self.contentView addSubview: self.writerLabel];
    [self.contentView addSubview: self.timeLabel];
    [self.contentView addSubview: self.viewingIcon];
    [self.contentView addSubview: self.shareIcon];
    
    [self.contentView addSubview: self.artLabel];
    [self.contentView addSubview: self.worksView1];
    [self.contentView addSubview: self.worksView2];
    [self.contentView addSubview: self.worksView3];
    [self.contentView addSubview: self.worksView4];
    
    return self;
}

- (void)layoutSubviews {
    self.headShot.frame = CGRectMake(10, 10, 80, 80);
    self.mainLabel.frame = CGRectMake(100, 10, 155, 50);
    self.writerLabel.frame = CGRectMake(100, 40, 155, 50);
    self.timeLabel.frame = CGRectMake(WIDTH - 75, 12, 155, 50);
    self.viewingIcon.frame = CGRectMake(270, 65, 26, 26);
    self.shareIcon.frame = CGRectMake(330, 65, 26, 26);
    
    self.artLabel.frame = CGRectMake(10, -5, 355, 50);
    self.worksView1.frame = CGRectMake(0, 35 + WIDTH * 0.618 * 0, WIDTH, WIDTH * 0.618);
    self.worksView2.frame = CGRectMake(0, 45 + WIDTH * 0.618 * 1, WIDTH, WIDTH * 0.618);
    self.worksView3.frame = CGRectMake(0, 55 + WIDTH * 0.618 * 2, WIDTH + 5, WIDTH / 0.618);
    self.worksView4.frame = CGRectMake(0, 55 + WIDTH * 0.618 * 2 + WIDTH / 0.618 + 10, WIDTH, WIDTH * 0.618);

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

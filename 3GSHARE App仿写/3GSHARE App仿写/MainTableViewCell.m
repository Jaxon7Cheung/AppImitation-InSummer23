//
//  MainTableViewCell.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/27.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    
    self.mainLabel = [[UILabel alloc] init];
    self.mainLabel.font = [UIFont boldSystemFontOfSize: 19];
    self.mainLabel.numberOfLines = 2;
    self.writerLabel = [[UILabel alloc] init];
    self.writerLabel.font = [UIFont boldSystemFontOfSize: 15];
    self.writerLabel.textColor = [UIColor darkGrayColor];
    self.typeLabel = [[UILabel alloc] init];
    self.typeLabel.font = [UIFont boldSystemFontOfSize: 11];
    self.typeLabel.textColor = [UIColor grayColor];
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont boldSystemFontOfSize: 11];
    self.timeLabel.textColor = [UIColor grayColor];
    //alloc后会自动释放吗？？？
    self.likeIcon = [UIButton buttonWithType: UIButtonTypeCustom];
    self.likeIcon.selected = NO;
    [self.likeIcon setImage: [UIImage imageNamed: @"aixin.png"] forState: UIControlStateSelected];
    [self.likeIcon setImage: [UIImage imageNamed: @"xihuan.png"] forState: UIControlStateNormal];
    [self.likeIcon addTarget: self action: @selector(pressLike:) forControlEvents: UIControlEventTouchUpInside];

    self.viewingIcon = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"guankan.png"]];
    self.shareIcon = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"fenxiang.png"]];
    
    if ([self.reuseIdentifier isEqualToString: @"paint"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"list_img2.png"]];
        //self.mainLabel = [[UILabel alloc] init];
        self.mainLabel.text = @"国外画册欣赏";
        //self.mainLabel.font = [UIFont systemFontOfSize: 20];
        self.writerLabel.text = @"SHARE 小王🃏";
        self.typeLabel.text = @"平面设计-画册设计";
        self.timeLabel.text = @"15分钟前";
    } else if ([self.reuseIdentifier isEqualToString: @"design"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"list_img3.png"]];
        //self.mainLabel = [[UILabel alloc] init];
        self.mainLabel.text = @"collection扁平设计";
        //self.mainLabel.font = [UIFont systemFontOfSize: 15];
        self.writerLabel.text = @"SHARE 小吕";
        self.typeLabel.text = @"平面设计-海报设计";
        self.timeLabel.text = @"17分钟前";
    } else if ([self.reuseIdentifier isEqualToString: @"order"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"list_img4.png"]];
        //self.mainLabel = [[UILabel alloc] init];
        self.mainLabel.text = @"版式整理术：高效解决多风格要求";
        //self.mainLabel.font = [UIFont systemFontOfSize: 15];
        self.writerLabel.text = @"SHARE 小王🃏";
        self.typeLabel.text = @"平面设计-样式设计";
        self.timeLabel.text = @"18分钟前";
    } else if ([self.reuseIdentifier isEqualToString: @"results1"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"list_img5.png"]];
        self.mainLabel.text = @"Icon of Baymax";
        self.writerLabel.text = @"SHARE 小白";
        self.typeLabel.text = @"原创-UI-icon";
        self.timeLabel.text = @"15分钟前";
    } else if ([self.reuseIdentifier isEqualToString: @"results2"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"list_img6.png"]];
        self.mainLabel.text = @"每个人都需要一个大白";
        self.writerLabel.text = @"SHARE 小王";
        self.typeLabel.text = @"原创作品-摄影";
        self.timeLabel.text = @"1个月前";
    } else if ([self.reuseIdentifier isEqualToString: @"jingxvan1"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"jingxvan1.png"]];
        self.mainLabel.text = @"如期而至";
        self.writerLabel.text = @"SHARE 钢蛋";
        self.timeLabel.text = @"16分钟前";
    } else if ([self.reuseIdentifier isEqualToString: @"jingxvan2"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"jingxvan2.png"]];
        self.mainLabel.text = @"duck的学问";
        self.writerLabel.text = @"SHARE 王二麻";
        self.timeLabel.text = @"20分钟前";
    } else if ([self.reuseIdentifier isEqualToString: @"jingxvan3"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"jingxvan3.png"]];
        self.mainLabel.text = @"您的故事";
        self.writerLabel.text = @"SHARE 和尚";
        self.timeLabel.text = @"25分钟前";
    } else if ([self.reuseIdentifier isEqualToString: @"jingxvan4"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"jingxvan4.png"]];
        self.mainLabel.text = @"八月的故事";
        self.writerLabel.text = @"SHARE 二五";
        self.timeLabel.text = @"1小时前";
    } else if ([self.reuseIdentifier isEqualToString: @"jingxvan5"]) {
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"jingxvan5.png"]];
        self.mainLabel.text = @"我们在夏枝繁荣时再见";
        self.writerLabel.text = @"SHARE 小唐";
        self.timeLabel.text = @"2小时前";
    } 
    
    [self.contentView addSubview: self.iView];
    [self.contentView addSubview: self.mainLabel];
    [self.contentView addSubview: self.writerLabel];
    [self.contentView addSubview: self.typeLabel];
    [self.contentView addSubview: self.timeLabel];
    [self.contentView addSubview: self.likeIcon];
    [self.contentView addSubview: self.viewingIcon];
    [self.contentView addSubview: self.shareIcon];
    
    return self;
}

- (void)layoutSubviews {
    self.iView.frame = CGRectMake(0, 0, 195, 145);
    self.mainLabel.frame = CGRectMake(200, 10, 155, 50);
    self.writerLabel.frame = CGRectMake(200, 40, 155, 50);
    self.typeLabel.frame = CGRectMake(200, 57, 155, 50);
    self.timeLabel.frame = CGRectMake(200, 72, 155, 50);
    self.likeIcon.frame = CGRectMake(210, 110, 26, 26);
    self.viewingIcon.frame = CGRectMake(270, 110, 26, 26);
    self.shareIcon.frame = CGRectMake(330, 110, 26, 26);

    [super layoutSubviews];
}

- (void)pressLike: (UIButton *)button {
        if (self.likeIcon.selected == YES) {
            self.likeIcon.selected = NO;
        } else {
            self.likeIcon.selected = YES;
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

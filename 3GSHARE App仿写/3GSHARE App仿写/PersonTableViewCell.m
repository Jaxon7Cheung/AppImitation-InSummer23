//
//  PersonTableViewCell.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/29.
//

#import "PersonTableViewCell.h"

@implementation PersonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString:@"first"]) {
        self.headPhotoImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"headShot.png"]];
        [self.headPhotoImageView.layer setMasksToBounds: YES];
        [self.headPhotoImageView.layer setCornerRadius: 12.0];
        [self.contentView addSubview: self.headPhotoImageView];
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.text = @"share 小白";
        [self.nameLabel setFont: [UIFont systemFontOfSize: 22]];
        [self.contentView addSubview: self.nameLabel];
        
        self.jobLabel = [[UILabel alloc] init];
        self.jobLabel.text = @"数媒/设计爱好者";
        self.jobLabel.font = [UIFont systemFontOfSize: 13];
        self.jobLabel.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview: self.jobLabel];
        
        self.signatureLabel = [[UILabel alloc] init];
        self.signatureLabel.text = @"开心了就笑，不开心了就待会儿再笑";
        self.signatureLabel.font = [UIFont systemFontOfSize: 13];
        [self.contentView addSubview: self.signatureLabel];
        
        self.whatButton = [[UIButton alloc] init];
        [self.whatButton setImage:[UIImage imageNamed: @"fenxiang.png"] forState: UIControlStateNormal];
        [self.whatButton setTitle: @"86" forState: UIControlStateNormal];
        [self.contentView addSubview: self.whatButton];
        
        
        self.loveButton = [[UIButton alloc] init];
        [self.loveButton setImage: [UIImage imageNamed:@"xihuan.png"] forState: UIControlStateNormal];
        [self.loveButton setTitle: @"766" forState: UIControlStateNormal];
        [self.contentView addSubview: self.loveButton];
        
        self.visitorButton = [[UIButton alloc] init];
        [self.visitorButton setImage: [UIImage imageNamed: @"guankan.png"] forState: UIControlStateNormal];
        [self.visitorButton setTitle: @"1042" forState: UIControlStateNormal];
        [self.contentView addSubview: self.visitorButton];
    }
    return self;
}

- (void)layoutSubviews {
    self.frame = CGRectMake(10, 10, 130, 130);
    self.nameLabel.frame = CGRectMake(150, 15, 120, 30);
    self.jobLabel.frame = CGRectMake(150, 40, 190, 30);
    self.signatureLabel.frame = CGRectMake(150, 80, 260, 30);
    self.loveButton.frame = CGRectMake(235, 120, 30, 30);
    self.visitorButton.frame = CGRectMake(295, 120, 30, 30);
    self.whatButton.frame = CGRectMake(175, 120, 30, 30);
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

//
//  AnalysisTableViewCell.m
//  天气预报App仿写
//
//  Created by  on 2023/8/4.
//

#import "AnalysisTableViewCell.h"

@implementation AnalysisTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString: @"analysis"]) {
        
    }
    
    return self;
}

- (void)layoutSubviews {
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

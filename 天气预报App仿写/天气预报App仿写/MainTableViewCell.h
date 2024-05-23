//
//  MainTableViewCell.h
//  天气预报App仿写
//
//  Created by . on 2023/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel* cityLabel;
@property (nonatomic, strong)UILabel* timeLabel;
@property (nonatomic, strong)UIImageView* iView;

@end

NS_ASSUME_NONNULL_END

//
//  HolidayTableViewCell.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@interface HolidayTableViewCell : UITableViewCell


@property (nonatomic, strong)UILabel* mainLabel;
@property (nonatomic, strong)UILabel* writerLabel;
@property (nonatomic, strong)UILabel* timeLabel;

@property (nonatomic, strong)UIImageView* viewingIcon;
@property (nonatomic, strong)UIImageView* shareIcon;
@property (nonatomic, strong)UIImageView* headShot;

@property (nonatomic, strong)UILabel* artLabel;
@property (nonatomic, strong)UIImageView* worksView1;
@property (nonatomic, strong)UIImageView* worksView2;
@property (nonatomic, strong)UIImageView* worksView3;
@property (nonatomic, strong)UIImageView* worksView4;
@end

NS_ASSUME_NONNULL_END

//
//  MainTableViewCell.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView* iView;
@property (nonatomic, strong)UILabel* mainLabel;
@property (nonatomic, strong)UILabel* writerLabel;
@property (nonatomic, strong)UILabel* typeLabel;
@property (nonatomic, strong)UILabel* timeLabel;
@property (nonatomic, strong)UIButton* likeIcon;
@property (nonatomic, strong)UIImageView* viewingIcon;
@property (nonatomic, strong)UIImageView* shareIcon;

@property (nonatomic, strong)UIImageView* headShot;
@property (nonatomic, strong)UILabel* mainTitle;
@property (nonatomic, strong)UILabel* subTitle;
@property (nonatomic, strong)UILabel* timeTitle;





@end

NS_ASSUME_NONNULL_END

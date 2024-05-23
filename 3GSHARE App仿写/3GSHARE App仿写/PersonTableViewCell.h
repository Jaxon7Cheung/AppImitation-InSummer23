//
//  PersonTableViewCell.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* headPhotoImageView;
@property (nonatomic, strong) UILabel* jobLabel;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* signatureLabel;
@property (nonatomic, strong) UIButton* loveButton;
@property (nonatomic, strong) UIButton* visitorButton;
@property (nonatomic, strong) UIButton* shareButton;
@property (nonatomic, strong) UIButton* whatButton;

@end

NS_ASSUME_NONNULL_END

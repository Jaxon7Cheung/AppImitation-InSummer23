//
//  BasicInformationTableViewCell.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BasicInformationTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel* tipLabel;
@property (nonatomic, strong) UILabel* detailLabel;
@property (nonatomic, strong) UILabel* deleteLabel;

@end

NS_ASSUME_NONNULL_END

//
//  SettingTableViewCell.h
//  网易云音乐App仿写
//
//  Created by 张旭洋 on 2023/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView* imageVieww;
@property (nonatomic, strong)UIImageView* imageViewh;

@property (nonatomic, strong)UISwitch* nightSwitch;

@end

NS_ASSUME_NONNULL_END

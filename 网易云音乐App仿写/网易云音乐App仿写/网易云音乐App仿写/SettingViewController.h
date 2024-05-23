//
//  SettingViewController.h
//  网易云音乐App仿写
//
//  Created by 张旭洋 on 2023/7/21.
//

#import <UIKit/UIKit.h>
#import "SettingTableViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface SettingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)SettingTableViewCell* cell;
@property (nonatomic, strong)SettingTableViewCell* cell00;
@property (nonatomic, strong)SettingTableViewCell* cell01;
@property (nonatomic, strong)SettingTableViewCell* cellNight;

@property (nonatomic, strong)UITableView* tableView;


@end

NS_ASSUME_NONNULL_END

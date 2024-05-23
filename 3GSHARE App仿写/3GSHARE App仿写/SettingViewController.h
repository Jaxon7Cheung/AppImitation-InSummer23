//
//  SettingViewController.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/29.
//

#import "ViewController.h"
#import "MessageSettingViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingViewController : ViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView* settingTableView;
@property (nonatomic, copy)NSArray* settingArray;
@property (nonatomic, strong)UIAlertController* alertController;
@property (nonatomic, strong)MessageSettingViewController* messageSettingViewController;

@end

NS_ASSUME_NONNULL_END

//
//  FourthViewController.h
//  ZARA App仿写
//
//  Created by 张旭洋 on 2023/7/20.
//

#import <UIKit/UIKit.h>
#import "MyTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FourthViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* emailLabel;
@property (nonatomic, strong) UILabel* addressLabel;
@property (nonatomic, strong) UITableViewCell* cell;
//@property (nonatomic, strong) MyTableViewCell* cell01;
@property (nonatomic, strong) UITableView* tableView;


@end

NS_ASSUME_NONNULL_END

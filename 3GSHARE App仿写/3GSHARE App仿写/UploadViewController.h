//
//  UploadViewController.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/29.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UploadViewController : ViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UIScrollView* scrollView;
@property (nonatomic, strong)UISegmentedControl* segmented;
@property (nonatomic, strong)UITableView* tableView01;
@property (nonatomic, strong)UITableView* tableView02;
@property (nonatomic, strong)UITableView* tableView03;

@end

NS_ASSUME_NONNULL_END

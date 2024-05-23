//
//  RecommandViewController.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/29.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecommendViewController : ViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView* scrollView;

@property (nonatomic, strong)UIView* holidayView;
@property (nonatomic, strong)UIView* paintView;
@property (nonatomic, strong)UIView* designView;
@property (nonatomic, strong)UIView* orderView;
@property (nonatomic, strong)UITableView* tableView;

@end

NS_ASSUME_NONNULL_END

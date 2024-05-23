//
//  SearchResultsViewController.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UISearchBar* searchBar;
@property (nonatomic, strong)UITableView* tableView;

@end

NS_ASSUME_NONNULL_END

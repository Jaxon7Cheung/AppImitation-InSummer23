//
//  FirstViewController.h
//  网易云音乐App仿写
//
//  Created by 张旭洋 on 2023/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UIBarButtonItem* leftBtn;
@property (nonatomic, strong)UIBarButtonItem* rightBtn;
//@property (nonatomic, strong)UITextField* searchField;
@property (nonatomic, strong)UISearchBar* searchBar;

@property (nonatomic, strong)UITableView* tableView;

@end

NS_ASSUME_NONNULL_END

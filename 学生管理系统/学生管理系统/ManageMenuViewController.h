//
//  ManageMenuViewController.h
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ModifyViewController.h"
#import "SearchViewController.h"
#import "SortViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManageMenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, AddDelegate, DeleteDelegate, ModifyDelegate>

- (void)pushName:(NSMutableArray *)arrayName andClass:(NSMutableArray *)arrayClass andNumber:(NSMutableArray *)arrayNumber;
- (void)pushDeleteName:(NSMutableArray *)arrayName andClass:(NSMutableArray *)arrayClass andNumber:(NSMutableArray *)arrayNumber;

@property (nonatomic, strong)UIImageView* iView;
@property (nonatomic, strong)UITableView* tableView;

@property (nonatomic, strong)NSMutableArray* arrayName;
@property (nonatomic, strong)NSMutableArray* arrayClass;
@property (nonatomic, strong)NSMutableArray* arrayNumber;


@property (nonatomic, strong)UIButton* addButton;
@property (nonatomic, strong)UIButton* deleteButton;
@property (nonatomic, strong)UIButton* modifyButton;
@property (nonatomic, strong)UIButton* searchButton;
@property (nonatomic, strong)UIButton* sortButton;
@property (nonatomic, strong)UIButton* exitButton;

@property (nonatomic, strong)AddViewController* addViewController;
@property (nonatomic, strong)DeleteViewController* deleteViewController;
@property (nonatomic, strong)ModifyViewController* modifyViewController;
@property (nonatomic, strong)SearchViewController* searchViewController;
@property (nonatomic, strong)SortViewController* sortViewController;
@end

NS_ASSUME_NONNULL_END

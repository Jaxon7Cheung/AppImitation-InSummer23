//
//  MyMessageViewController.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/30.
//

#import "ViewController.h"
#import "NewSubscribeViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyMessageViewController : ViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView* tableView;
@property (copy, nonatomic) NSArray* informationArray;
@property (copy, nonatomic) NSArray* informationNumberArray;
@property (nonatomic, strong)NewSubscribeViewController* subscribeViewController;


@end

NS_ASSUME_NONNULL_END

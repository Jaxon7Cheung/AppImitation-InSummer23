//
//  NewSubscribeViewController.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/30.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewSubscribeViewController : ViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* subscribeTableView;
@property (nonatomic, strong) NSArray* nameArray;


@end

NS_ASSUME_NONNULL_END

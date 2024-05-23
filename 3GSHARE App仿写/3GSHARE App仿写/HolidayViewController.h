//
//  HolidayViewController.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HolidayDelegate <NSObject>

- (void)pushHeart: (BOOL)select;

@end

@interface HolidayViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)id<HolidayDelegate> delegate;

@property (nonatomic, strong)UIButton* likeIcon;
@property (nonatomic, strong)UITableView* tableView;

@end

NS_ASSUME_NONNULL_END

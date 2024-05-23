//
//  FirstViewController.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/26.
//

#import "ViewController.h"
#import "MainTableViewCell.h"
#import "HolidayViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : ViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, HolidayDelegate>

@property (nonatomic, strong)UIScrollView* scrollView;
@property (nonatomic, strong)UIScrollView* advertisementView;
@property NSUInteger currentImageIndex;
@property (nonatomic, strong)UIImageView* leftImageView;
@property (nonatomic, strong)UIImageView* centerImageView;
@property (nonatomic, strong)UIImageView* rightImageView;
@property (nonatomic, strong)UIPageControl* pageControl;
@property (nonatomic, strong)NSTimer* timer;

@property (nonatomic, strong)HolidayViewController* holidayVieww;
@property (nonatomic, strong)UIView* holidayView;
@property (nonatomic, strong)UIView* paintView;
@property (nonatomic, strong)UIView* designView;
@property (nonatomic, strong)UIView* orderView;
@property (nonatomic, strong)UITableView* tableView;

@property (nonatomic, strong)UIImageView* iView;
@property (nonatomic, strong)UILabel* mainLabel;
@property (nonatomic, strong)UILabel* writerLabel;
@property (nonatomic, strong)UILabel* typeLabel;
@property (nonatomic, strong)UILabel* timeLabel;
@property (nonatomic, strong)UIButton* likeIcon;
@property (nonatomic, strong)UIImageView* viewingIcon;
@property (nonatomic, strong)UIImageView* shareIcon;

@end

NS_ASSUME_NONNULL_END

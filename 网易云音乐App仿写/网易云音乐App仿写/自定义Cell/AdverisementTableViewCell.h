//
//  AdverisementTableViewCell.h
//  网易云音乐App仿写
//
//  Created by 张旭洋 on 2023/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdverisementTableViewCell : UITableViewCell <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

//首推界面
@property (nonatomic, strong)UIScrollView* scrollView;
@property (nonatomic, strong)UIPageControl* pageControl;
@property NSUInteger currentImageIndex;
@property (nonatomic, strong)UIImageView* centerImageView;
@property (nonatomic, strong)UIImageView* leftImageView;
@property (nonatomic, strong)UIImageView* rightImageView;

//选项界面
@property (nonatomic, strong)UIScrollView* scrollView01;
@property (nonatomic, strong)UIScrollView* scrollView02;

@property (nonatomic, strong)UIScrollView* scrollView03;
@property (nonatomic, strong) UILabel* label03;
@property (nonatomic, strong)UITableView* tableView03;
@property (nonatomic, strong)UITableView* tableView0301;
@property (nonatomic, strong)UITableView* tableView0302;
@property (nonatomic, strong)UITableView* tableView0303;
@property (nonatomic, strong)NSTimer* timer;

@property (nonatomic, strong)UILabel* label;
@property (nonatomic, strong)UILabel* label02;
@property (nonatomic, strong)UILabel* label2;
@property (nonatomic, strong)UILabel* labelR;


@end

NS_ASSUME_NONNULL_END

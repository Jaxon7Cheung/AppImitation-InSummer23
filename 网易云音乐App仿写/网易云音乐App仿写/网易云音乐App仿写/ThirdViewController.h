//
//  ThirdViewController.h
//  网易云音乐App仿写
//
//  Created by 张旭洋 on 2023/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThirdViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UIBarButtonItem* leftBtn;
@property (nonatomic, strong)UIBarButtonItem* rightBtn;

@property (nonatomic, strong)UIScrollView* scrollView;
@property (nonatomic, strong)UIView* topView;
@property (nonatomic, strong)UIImageView* topViewIdentif;
@property (nonatomic, strong)UIImageView* topViewState;
@property (nonatomic, strong)UIImageView* topViewVip;
@property (nonatomic, strong)UILabel* nameD;
@property (nonatomic, strong)UILabel* subLabel;

@property (nonatomic, strong)UIView* secondView;
@property (nonatomic, strong)UILabel* secondLabel01;
@property (nonatomic, strong)UILabel* secondLabel02;

@property (nonatomic, strong)UIView* thirdView;
@property (nonatomic, strong)UIImageView* likeView;
@property (nonatomic, strong)UILabel* supLabel;
@property (nonatomic, strong)UILabel* subbLabel;
@property (nonatomic, strong)UIImageView* heartView;

@property (nonatomic, strong)UIButton* btnLeft;
@property (nonatomic, strong)UIButton* btnRight;
@property (nonatomic, strong)UIView* redView;
@property (nonatomic, strong)UIScrollView* scrollView01;
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)UITableView* tableView01;


@end

NS_ASSUME_NONNULL_END

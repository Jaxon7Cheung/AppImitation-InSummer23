//
//  AnalysisViewController.h
//  天气预报App仿写
//
//  Created by 张旭洋 on 2023/8/4.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

//@protocol NextPageDelegate <NSObject>
//- (void)didDismissNextPageWithInitialization: (NSMutableArray *)value;
//@end

@interface AnalysisViewController : ViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

//@property (nonatomic, weak) id<NextPageDelegate> delegate;

@property (nonatomic, strong)NSMutableArray* cityData;
//@property (nonatomic, strong)NSMutableDictionary* dic;
@property (nonatomic, strong)NSMutableArray* dicArray;
@property (nonatomic, strong)UIScrollView* scrollView;
@property (nonatomic, assign)NSInteger currentPlace;
@property (nonatomic, strong)UIButton* cancelButton;
@property (nonatomic, strong)UIPageControl* pageControl;
//@property (nonatomic, strong)UITableView* tableView;

@property (nonatomic, strong)UILabel* cityName;
@property (nonatomic, strong)UILabel* weaData;
@property (nonatomic, strong)UILabel* temData;
@property (nonatomic, strong)UILabel* tem1Data;
@property (nonatomic, strong)UILabel* tem2Data;
@property (nonatomic, strong)UILabel* weekData;

@property (nonatomic, strong)UIScrollView* smallScrollView;

@property (nonatomic, strong)UILabel* tips;

@property (nonatomic, strong)UILabel* rightTitle;
@property (nonatomic, strong)UILabel* leftTitle;
@property (nonatomic, strong)UILabel* sunriseTime;
@property (nonatomic, strong)UILabel* sunsetTime;
//@property (nonatomic, strong)UILabel* rainRate;
//@property (nonatomic, strong)UILabel* humidityValue;
//@property (nonatomic, strong)UILabel* win;
//@property (nonatomic, strong)UILabel* feelTem;
//@property (nonatomic, strong)UILabel* rainAmount;
//@property (nonatomic, strong)UILabel* airPasca;
//@property (nonatomic, strong)UILabel* seeAble;
//@property (nonatomic, strong)UILabel* purpleOutLine;

@end

NS_ASSUME_NONNULL_END

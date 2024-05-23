//
//  DetailViewController.h
//  天气预报App仿写
//
//  Created by . on 2023/8/1.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : ViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UIButton* cancelButton;
@property (nonatomic, strong)UIButton* addButton;
@property (nonatomic, strong)NSString* cityNameString;
@property (nonatomic, strong)NSString* updatedCityNameString;
@property (nonatomic, strong)UILabel* cityName;
@property (nonatomic, strong)NSMutableArray* timeData;
@property (nonatomic, strong)NSMutableArray* cityData;
@property (nonatomic, strong)NSMutableArray* weatherimgData;
@property (nonatomic, strong)UIScrollView* scrollView;
@property (nonatomic, strong)UITableView* tableView;

@property (nonatomic, strong)NSMutableArray* dayData;
@property (nonatomic, strong)NSMutableArray* dateData;

@property (nonatomic, strong)NSMutableArray* weaIcon;
@property (nonatomic, strong)NSMutableArray* wea;

@property (nonatomic, strong)NSMutableArray* tem1Data;
@property (nonatomic, strong)NSMutableArray* tem2Data;

@property (nonatomic, strong)NSMutableArray* weaNightIcon;
@property (nonatomic, strong)NSMutableArray* weaNight;

@property (nonatomic, strong)NSMutableArray* winSpeed;
@property (nonatomic, strong)NSMutableArray* airLevel;

@property (nonatomic, strong)NSDictionary* dic;

@end

NS_ASSUME_NONNULL_END

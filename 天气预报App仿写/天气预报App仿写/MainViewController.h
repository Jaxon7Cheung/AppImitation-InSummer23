//
//  MainViewController.h
//  天气预报App仿写
//
//  Created by . on 2023/8/1.
//

#import "ViewController.h"
#import "AddViewController.h"
#import "DetailViewController.h"
#import "AnalysisViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource /*NextPageDelegate*/>

@property (nonatomic, strong)AddViewController* addViewController;
@property (nonatomic, strong)DetailViewController* detailViewController;
@property (nonatomic, strong)NSMutableArray* timeData;
@property (nonatomic, strong)NSMutableArray* cityData;
@property (nonatomic, strong)NSMutableArray* weatherimgData;
@property (nonatomic, strong)UITableView* tableView;

@property (nonatomic, strong)NSMutableArray* dicArray;
//@property (nonatomic, strong)NSDictionary* dic;

@end

NS_ASSUME_NONNULL_END

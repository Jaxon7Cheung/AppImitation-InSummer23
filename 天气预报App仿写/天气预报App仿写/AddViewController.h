//
//  AddViewController.h
//  天气预报App仿写
//
//  Created by . on 2023/8/1.
//

#import "ViewController.h"
#import "DetailViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, NSURLSessionDelegate>

@property (nonatomic, strong)UISearchBar* searchBar;
@property (nonatomic, strong)UITableView* tableView;

@property (nonatomic, strong)DetailViewController* detailViewController;
@property (nonatomic, strong)NSMutableData* data;
@property (nonatomic, strong)NSMutableArray* cityArray;
@property (nonatomic, strong)NSMutableArray* messageData;
@property (nonatomic, strong)NSMutableString* stringMessage;

@property (nonatomic, strong)NSMutableArray* timeData;
@property (nonatomic, strong)NSMutableArray* cityData;
@property (nonatomic, strong)NSMutableArray* weatherimgData;

@end

NS_ASSUME_NONNULL_END

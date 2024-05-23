//
//  MainViewController.m
//  天气预报App仿写
//
//  Created by . on 2023/8/1.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "AddViewController.h"
#import "DetailViewController.h"
#import "NSMutableArray+ErrorHandle.h"
#import "AnalysisViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithDisplayP3Red: 30.0 / 255 green: 70.0 / 255 blue: 130.0 / 255 alpha: 1.0];
    
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"add.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressAdd)];
    addButton.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = addButton;
    UIBarButtonItem* menuButton = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"menu.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressMenu)];
    menuButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = menuButton;
    
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(WIDTH / 2 - 183, 0, 366, HEIGHT) style: UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview: self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"main"];
    
    
    self.cityData = [[NSMutableArray alloc] init];
    //self.cityData[0] = @"西安";
    self.timeData = [[NSMutableArray alloc] init];
    //self.timeData[0] = @"26";
    self.weatherimgData = [[NSMutableArray alloc] init];
    //self.weatherimgData[0] = @"qing";
    //self.weatherimgData[1] = @"yu";
    
    self.dicArray = [[NSMutableArray alloc] init];
    
    //for (int i = 0; i < self.dicArray.count; ++i) NSLog(@"%@", self.dicArray[i][@"city"]);
    
    
//    [NSNotificationCenter defaultCenter] postNotificationName: @"" object:<#(nullable id)#> userInfo:<#(nullable NSDictionary *)#>
    //注册观察者用于接收通知
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(notice:) name: @"1" object: nil];
    
    
}

- (void)notice: (NSNotification *)sender {
    
    self.cityData = [NSMutableArray arrayWithArray: sender.userInfo[@"cityData"]];
    //for (int i = 0; i < self.cityData.count; ++i) {NSLog(@"%@", self.cityData[i]);NSLog(@"\n");}
    self.timeData = [NSMutableArray arrayWithArray: sender.userInfo[@"timeData"]];
    self.weatherimgData = [NSMutableArray arrayWithArray: sender.userInfo[@"weatherimgData"]];
    //[self.cityData addObject: sender.userInfo[@"key"]];
    
    //位置找的好辛苦啊🤔 ！！！
    //[self createUrl];
    [self pressMenu];
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cityData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UITableViewHeaderFooterView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* view = [[UITableViewHeaderFooterView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier: @"main" forIndexPath: indexPath];
    
    cell.cityLabel.text = self.cityData[indexPath.section];
    if (self.timeData.count > indexPath.section) {
        cell.timeLabel.text = self.timeData[indexPath.section];
    }
    if (self.weatherimgData.count > indexPath.section) {
        cell.iView.image = [UIImage imageNamed: [NSString stringWithFormat: @"%@.png", self.weatherimgData[indexPath.section]]];
    }
    
    
    return cell;
}

- (void)createUrl {
    if (self.cityData.count > 0) {
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        
        for (int i = 0; i < self.cityData.count; ++i) {
            NSString* urlString = [NSString stringWithFormat:@"https://v0.yiketianqi.com/api?unescape=1&version=v9&appid=72961936&appsecret=m78Z0m2T&city=%@", self.cityData[i]];
            urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            NSURL* url = [NSURL URLWithString:urlString];

            NSURLSession* session = [NSURLSession sharedSession];
            NSURLSessionTask* dataTask = [session dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (!error) {
                    NSMutableDictionary* dic = [NSJSONSerialization JSONObjectWithData: data options:kNilOptions error: &error];
                    [self.dicArray addObject: dic];
                    //NSLog(@"request");
                    //NSLog(@"%@", self.dicArray[i][@"city"]);
                    //self.dic = [[NSMutableDictionary alloc] initWithDictionary: dic];
                    //NSLog(@"%lu", self.dicArray.count);
                    //NSLog(@"%lu", self.cityData.count);
                    NSLog(@"%@", dic);
                }
                dispatch_semaphore_signal(semaphore);
            }];
            
            
            [dataTask resume];
            
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        }
        
    }
}

- (void)pressAdd {
    self.addViewController = [[AddViewController alloc] init];
    self.addViewController.cityData = self.cityData;
    self.addViewController.timeData = self.timeData;
    self.addViewController.weatherimgData = self.weatherimgData;
    [self presentViewController: self.addViewController animated: YES completion: nil];
}

- (void)pressMenu {
    self.dicArray = [[NSMutableArray alloc] init];
    [self createUrl];
    //NSLog(@"2");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[self createUrl: indexPath];
    
    AnalysisViewController* analysisViewController = [[AnalysisViewController alloc] init];
    
    analysisViewController.dicArray = self.dicArray;
    //analysisViewController.delegate = self;
    
    //analysisViewController.cityData = self.cityData;
    //analysisViewController.dic = [[NSMutableDictionary alloc] initWithDictionary: self.dic];
    analysisViewController.currentPlace = indexPath.section;
    //NSLog(@"%lu", indexPath.section);
    analysisViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    //if (self.dicArray.count == 0) {
        
    //} else {
        [self presentViewController: analysisViewController animated: YES completion: nil];
    //}
//        MainViewController *viewcontroller = [[MainViewController alloc] init];
//        viewcontroller.modalPresentationStyle = UIModalPresentationFullScreen;
//        viewcontroller.nameArray = _nameArray;
//        viewcontroller.nowplace = indexPath.row;
//        [self presentViewController:viewcontroller animated:YES completion: nil];  
}

//- (void)didDismissNextPageWithInitialization:(NSMutableArray *)value {
//    self.dicArray = [NSMutableArray arrayWithArray: value];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

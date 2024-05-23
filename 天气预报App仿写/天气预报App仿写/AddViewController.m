//
//  AddViewController.m
//  天气预报App仿写
//
//  Created by  on 2023/8/1.
//

#import "AddViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "SearchTableViewCell.h"
#import "DetailViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView  *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.alpha = 0.70;//设置透明度
    blurEffectView.frame = self.view.frame;
    //self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: blurEffectView];
    //self.view.alpha = 0.5;
    
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.placeholder = @"请输入您要搜索的城市";
    self.searchBar.showsScopeBar = YES;
    self.searchBar.frame = CGRectMake(0, 0, WIDTH, 66);
    self.searchBar.translucent = YES;
    self.searchBar.alpha = 0.60;
    [self.view addSubview: self.searchBar];
    self.searchBar.delegate = self;
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 66, WIDTH, HEIGHT - 66);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = YES;
    [self.view addSubview: self.tableView];
    [self.tableView registerClass: [SearchTableViewCell class] forCellReuseIdentifier: @"search"];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.searchBar.text = self.messageData[indexPath.row];
//    lookviewcontroller.CityString = _cityArray[NSIndexPath.row];
//    lookviewcontroller.nameArray = _nameArray;
    
    self.detailViewController = [[DetailViewController alloc] init];
    self.detailViewController.modalPresentationStyle = UIModalPresentationFullScreen;

    self.detailViewController.cityNameString = self.cityArray[indexPath.row];
    //NSLog(@"%@", self.cityArray[indexPath.row]);
    
    self.detailViewController.cityData = self.cityData;
    self.detailViewController.timeData = self.timeData;
    self.detailViewController.weatherimgData = self.weatherimgData;
    [self presentViewController: self.detailViewController animated: YES completion: nil];
//    _textField.text = _cityArray[indexPath.row];
//    hang = indexPath.row;
//    LookViewController *lookviewcontroller = [[LookViewController alloc] init];
//    lookviewcontroller.modalPresentationStyle = UIModalPresentationFullScreen;
//    lookviewcontroller.CityString = _cityArray[hang];
//    lookviewcontroller.nameArray = _nameArray;
//    [self presentViewController:lookviewcontroller animated:YES completion:nil];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.messageData = [[NSMutableArray alloc] init];
    self.cityArray = [[NSMutableArray alloc] init];
    //if (!self.cityData) self.cityData = [[NSMutableArray alloc] init];
//    for (int i = 0; i <  self.cityData.count; ++i) {
//        NSLog(@"%@", self.cityData[i]);
//    }
    [self createUrl];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.messageData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier: @"search" forIndexPath: indexPath];
    
    //？？
//    while ([cell.contentView.subviews lastObject] != nil) {
//        [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
//    }
    
    cell.label.text = self.messageData[indexPath.row];
    return cell;
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    [self createUrl];
//    self.messageData = [[NSMutableArray alloc] init];
//    //_xianshiArray = [[NSMutableArray alloc] init];
//    return YES;
//}

- (void)createUrl {
    NSString *urlString = [NSString stringWithFormat:@"https://www.mxnzp.com/api/address/search?type=1&value=%@&app_id=tsaorkh0kiui8vvi&app_secret=TRCPftDwAdplz5pYTKWyRR5nnJebdOgC", self.searchBar.text];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    //2.创建请求类
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //3.创建会话
    //delegateQueue 表示协议方法在哪个线程中执行
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate: self  delegateQueue:[NSOperationQueue mainQueue]];
    //4.根据会话创建任务
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];
    //5.启动任务
    [dataTask resume];
    
    
}
//接收服务器的响应
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    if(self.data == nil){
        self.data = [[NSMutableData alloc] init];
    } else {
        self.data.length = 0;
    }
    
    completionHandler(NSURLSessionResponseAllow);
}
//接收到数据，该方法会被调用多次
- (void)URLSession:(NSURLSession *)session dataTask:( NSURLSessionDataTask *)dataTask didReceiveData:( NSData *)data {
    [self.data appendData:data];
}
//数据请求完成或者请求出现错误调用的方法
- (void)URLSession:(NSURLSession *)session task:( NSURLSessionTask *)task didCompleteWithError:( NSError *)error {
    if (error == nil) {
        //解析数据
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData: self.data options:kNilOptions error: nil];
        NSArray *provinces = dic[@"data"];
        for (NSDictionary *province in provinces) {
            NSString *provinceName = province[@"name"];
            NSArray *cities = province[@"pchilds"];
            for (NSDictionary *city in cities) {
                NSString *cityName = city[@"name"];
                NSArray *counties = city[@"cchilds"];
                for (NSDictionary *county in counties) {
                    NSString *countyName = county[@"name"];
                    [self.messageData addObject: [NSString stringWithFormat: @"%@ - %@ - %@", provinceName, cityName, countyName]];
                    [self.cityArray addObject: [NSString stringWithFormat: @"%@", countyName]];
                    //NSLog(@"%@ - %@ - %@", provinceName, cityName, countyName);
                }
            }
        }

    }
    [self.tableView reloadData];

}

//- (void)createUrl {
//    //for (int i = 0; i < self.messageData.count; ++i) {
//        NSString* urlString = [NSString stringWithFormat:@"https://www.mxnzp.com/api/address/search?type=1&value=%@&app_id=tsaorkh0kiui8vvi&app_secret=TRCPftDwAdplz5pYTKWyRR5nnJebdOgC", self.searchBar.text];
//        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//        NSURL* url = [NSURL URLWithString:urlString];
//
//        NSURLSession* session = [NSURLSession sharedSession];
//
//        NSURLSessionTask* dataTask = [session dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//            if (!error) {
//                NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//                NSMutableArray *array1 = [[NSMutableArray alloc] init];
//                array1 = dic[@"data"];
//                NSMutableArray *array2 = [[NSMutableArray alloc] init];
//                array2 = dic[@"pchilds"];
//                NSMutableArray *array3 = [[NSMutableArray alloc] init];
//                array3 = dic[@"cchilds"];
//                for (int i = 0; i < array1.count; ++i) {
//                    for (int j = 0; j < array2.count; ++j) {
//                        for (int k = 0; k < array3.count; ++k) {
//                            self.stringMessage = [NSMutableString stringWithFormat:@"%@ - %@ - %@", dic[@"data"][i][@"name"], dic[@"data"][i][@"pchilds"][j][@"name"], dic[@"data"][i][@"pchilds"][j][@"cchilds"][k][@"name"]];
//                            [self.messageData addObject: self.stringMessage];
//                            NSLog(@"%@", self.stringMessage);
//                        }
//                    }
//
//                }
//
//                //NSLog(@"%@", dic[@"data"][0][@"pchilds"][0][@"cchilds"][1][@"name"]);
//
//                //NSDate* timeDate = [NSDate date];
//                //NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//                //[dateFormatter setDateFormat: @"HH:mm"];
//                ///NSString *locationString = [dateFormatter stringFromDate:timeDate];
//
//
//                //[_timearray addObject:locationString];
//                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                    //NSLog(@"dic = %@", dic);
//                    [self->_tableView reloadData];
//                }];
//            }
//        }];
//        [dataTask resume];
//    //}
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

//
//  AnalysisViewController.m
//  天气预报App仿写
//
//  Created by  on 2023/8/4.
//

#import "AnalysisViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "AnalysisTableViewCell.h"

@interface AnalysisViewController ()

@end

@implementation AnalysisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithDisplayP3Red: 30.0 / 255 green: 70.0 / 255 blue: 130.0 / 255 alpha: 1.0];
    
    self.cancelButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.cancelButton.frame = CGRectMake(10, 45, 30, 30);
    [self.cancelButton setTintColor: [UIColor whiteColor]];
    [self.cancelButton setImage: [UIImage imageNamed: @"cancel.png"] forState: UIControlStateNormal];
    [self.cancelButton addTarget: self action: @selector(pressCancel) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: self.cancelButton];
    
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 90, WIDTH, HEIGHT)];
    self.scrollView.contentSize = CGSizeMake(WIDTH * self.dicArray.count, HEIGHT);
    self.scrollView.scrollEnabled = YES;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    [self.view addSubview: self.scrollView];
    
    for (int i = 0; i < self.dicArray.count; ++i) {
        UITableView* tableView = [[UITableView alloc] initWithFrame: CGRectMake(WIDTH * i, 0, WIDTH, HEIGHT) style: UITableViewStylePlain];
        tableView.delegate = self;
        tableView.tag = i;
        tableView.dataSource = self;
        tableView.showsVerticalScrollIndicator = NO;
        [self.scrollView addSubview: tableView];
        tableView.backgroundColor = [UIColor clearColor];
        [tableView registerClass: [AnalysisTableViewCell class] forCellReuseIdentifier: @"analysis"];
        
        NSMutableDictionary* dic = [[NSMutableDictionary alloc] initWithDictionary: self.dicArray[i]];
        UIImageView* background = [ [UIImageView alloc] initWithImage: [UIImage imageNamed: [NSString stringWithFormat: @"%@Background.png", dic[@"data"][0][@"wea_img"]]]];
        [tableView setBackgroundView:background];
    }
    
    [self.scrollView setContentOffset: CGPointMake(WIDTH * self.currentPlace, 0)];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return HEIGHT * 2 / 5;
    } else if (indexPath.row == 1) {
        return HEIGHT / 5;
    } else if (indexPath.row == 2) {
        return HEIGHT / 5 * 2.5;
    } else {
        return HEIGHT / 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AnalysisTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: @"analysis"];
    cell.contentView.backgroundColor = [UIColor clearColor];
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] initWithDictionary: self.dicArray[tableView.tag]];
    if (indexPath.row == 0) {
        self.cityName = [[UILabel alloc] init];
        self.cityName.text = dic[@"city"];
        self.cityName.frame = CGRectMake(0, 40, WIDTH, 32);
        self.cityName.font = [UIFont systemFontOfSize: 32];
        self.cityName.textColor = [UIColor whiteColor];
        self.cityName.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview: self.cityName];
        self.weaData = [[UILabel alloc] init];
        self.weaData.text = dic[@"data"][0][@"wea"];
        self.weaData.frame = CGRectMake(0, 75, WIDTH, 20);
        self.weaData.font = [UIFont systemFontOfSize: 18];
        self.weaData.textColor = [UIColor lightGrayColor];
        self.weaData.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview: self.weaData];
        self.temData = [[UILabel alloc] init];
        self.temData.text = dic[@"data"][0][@"tem"];
        self.temData.frame = CGRectMake(0, 125, WIDTH, 100);
        self.temData.font = [UIFont systemFontOfSize: 100];
        self.temData.textColor = [UIColor whiteColor];
        self.temData.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview: self.temData];
        self.tem1Data = [[UILabel alloc] init];
        self.tem1Data.text = dic[@"data"][0][@"tem1"];
        self.tem1Data.frame = CGRectMake(WIDTH - 110, 285, 50, 50);
        self.tem1Data.font = [UIFont systemFontOfSize: 20];
        self.tem1Data.textColor = [UIColor whiteColor];
        self.tem1Data.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview: self.tem1Data];
        self.tem2Data = [[UILabel alloc] init];
        self.tem2Data.text = dic[@"data"][0][@"tem2"];
        self.tem2Data.frame = CGRectMake(WIDTH - 60, 285, 50, 50);
        self.tem2Data.font = [UIFont systemFontOfSize: 20];
        self.tem2Data.textColor = [UIColor lightGrayColor];
        self.tem2Data.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview: self.tem2Data];
        self.weekData = [[UILabel alloc] init];
        self.weekData.text = [NSString stringWithFormat: @"%@ 今天", dic[@"data"][0][@"week"]];
        self.weekData.frame = CGRectMake(20, 285, 125, 50);
        self.weekData.font = [UIFont systemFontOfSize: 22];
        self.weekData.textColor = [UIColor whiteColor];
        [cell.contentView addSubview: self.weekData];
        return cell;
    } else if (indexPath.row == 1) {
        self.smallScrollView = [[UIScrollView alloc] init];
        self.smallScrollView.frame = CGRectMake(0, 0, WIDTH, HEIGHT / 5);
        
        self.smallScrollView.scrollEnabled = YES;
        self.smallScrollView.showsHorizontalScrollIndicator = NO;
        
        NSMutableArray* hoursArray = [[NSMutableArray alloc] init];
        hoursArray = dic[@"data"][0][@"hours"];
        //NSLog(@"%lu", hoursArray.count);
        self.smallScrollView.contentSize = CGSizeMake((WIDTH - 84) / 4 * hoursArray.count + 10, cell.contentView.bounds.size.height);
        for (int i = 0; i < hoursArray.count; ++i) {
            //            self.tmpTimeData = [[NSMutableArray alloc] init];
            //            [self.tmpTemData addObject: hoursArray[i][@"tem"]];
            //            self.weaIconData = [[NSMutableArray alloc] init];
            //            [self.tmpTemData addObject: hoursArray[i][@"tem"]];
            //            self.tmpTemData = [[NSMutableArray alloc] init];
            //            [self.tmpTemData addObject: hoursArray[i][@"tem"]];
            UILabel* tmpTimeTime = [[UILabel alloc] init];
            tmpTimeTime.text = hoursArray[i][@"hours"];
            //NSLog(@"%@", hoursArray[i][@"hours"]);
            tmpTimeTime.font = [UIFont systemFontOfSize: 20];
            tmpTimeTime.textAlignment = NSTextAlignmentCenter;
            tmpTimeTime.textColor = [UIColor whiteColor];
            tmpTimeTime.frame = CGRectMake(10 + (WIDTH - 84) / 4 * i, 10, 64, 32);
            [self.smallScrollView addSubview: tmpTimeTime];
            
            //            self.tmpTimeData = [[UILabel alloc] init];
            //            self.tmpTimeData.text = hoursArray[i][@"hours"];
            //            //NSLog(@"%@", hoursArray[i][@"hours"]);
            //            self.tmpTimeData.font = [UIFont systemFontOfSize: 20];
            //            self.tmpTimeData.textColor = [UIColor whiteColor];
            //            self.tmpTimeData.frame = CGRectMake(10 + (WIDTH - 20) / 4 * i, 25, WIDTH / 5, 33);
            //            [self.smallScrollView addSubview: self.tmpTemData];
            //            NSLog(@"111");
            
            UIImageView* iView = [[UIImageView alloc] initWithFrame: CGRectMake(26 + (WIDTH - 84) / 4 * i, 60, 32, 32)];
            iView.image = [UIImage imageNamed: [NSString stringWithFormat: @"%@Icon.png", hoursArray[i][@"wea_img"]]];
            [self.smallScrollView addSubview: iView];
            
            UILabel* tmpTem = [[UILabel alloc] initWithFrame: CGRectMake(26 + (WIDTH - 84) / 4 * i, 110, 32, 32)];
            tmpTem.text = hoursArray[i][@"tem"];
            //NSLog(@"%@", hoursArray[i][@"hours"]);
            tmpTem.font = [UIFont systemFontOfSize: 20];
            tmpTem.textAlignment = NSTextAlignmentCenter;
            tmpTem.textColor = [UIColor whiteColor];
            [self.smallScrollView addSubview: tmpTem];
            
        }
        [cell.contentView addSubview: self.smallScrollView];
        return cell;
    } else if (indexPath.row == 2) {
        for (int i = 0; i < 7; ++i) {
            UILabel* weekLabel = [[UILabel alloc] initWithFrame: CGRectMake(16, 10 + (HEIGHT / 5 * 2.5 - 52) / 6 * i, 64, 32)];
            weekLabel.text = dic[@"data"][i][@"week"];
            weekLabel.font = [UIFont systemFontOfSize: 20];
            weekLabel.textAlignment = NSTextAlignmentCenter;
            weekLabel.textColor = [UIColor whiteColor];
            [cell.contentView addSubview: weekLabel];
            
            UIImageView* iView = [[UIImageView alloc] initWithFrame: CGRectMake(26 + (WIDTH - 84) / 4 * 2, (HEIGHT / 5 * 2.5 - 52) / 6 * i, 32, 32)];
            iView.image = [UIImage imageNamed: [NSString stringWithFormat: @"%@Icon.png", dic[@"data"][i][@"wea_img"]]];
            [cell.contentView addSubview: iView];
            
            UILabel* tem1Data = [[UILabel alloc] initWithFrame: CGRectMake(WIDTH - 110, 10 + (HEIGHT / 5 * 2.5 - 52) / 6 * i, 32, 32)];
            tem1Data.text = dic[@"data"][0][@"tem1"];
            tem1Data.font = [UIFont systemFontOfSize: 20];
            tem1Data.textColor = [UIColor whiteColor];
            tem1Data.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview: tem1Data];
            
            UILabel* tem2Data = [[UILabel alloc] initWithFrame: CGRectMake(WIDTH - 60, 10 + (HEIGHT / 5 * 2.5 - 52) / 6 * i, 32, 32)];
            tem2Data.text = dic[@"data"][0][@"tem2"];
            tem2Data.font = [UIFont systemFontOfSize: 20];
            tem2Data.textColor = [UIColor lightGrayColor];
            tem2Data.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview: tem2Data];
            
        }
        return cell;
    } else if (indexPath.row == 3) {
        self.tips = [[UILabel alloc] initWithFrame: CGRectMake(26, HEIGHT / 20 - 32, WIDTH - 50, 64)];
        self.tips.numberOfLines = 0;
        self.tips.text = [NSString stringWithFormat: @"提示：%@", dic[@"data"][0][@"air_tips"]];
        self.tips.font = [UIFont systemFontOfSize: 18];
        self.tips.textColor = [UIColor whiteColor];
        
        [cell.contentView addSubview: self.tips];
        return cell;
    } else if (indexPath.row == 4) {
        self.leftTitle = [[UILabel alloc] initWithFrame: CGRectMake(26, 10, 96, 16)];
        self.leftTitle.text = @"日出";
        self.leftTitle.textColor = [UIColor grayColor];
        self.leftTitle.font = [UIFont systemFontOfSize: 16];
        [cell.contentView addSubview: self.leftTitle];
        
        self.rightTitle = [[UILabel alloc] initWithFrame: CGRectMake(WIDTH / 2 + 32, 10, 96, 16)];
        self.rightTitle.text = @"日落";
        self.rightTitle.textColor = [UIColor grayColor];
        self.rightTitle.font = [UIFont systemFontOfSize: 16];
        [cell.contentView addSubview: self.rightTitle];
        
        self.sunriseTime = [[UILabel alloc] initWithFrame: CGRectMake(26, 29, WIDTH / 2, 37)];
        self.sunriseTime.text = dic[@"data"][0][@"sunrise"];
        self.sunriseTime.textColor = [UIColor whiteColor];
        self.sunriseTime.font = [UIFont systemFontOfSize: 37];
        [cell.contentView addSubview: self.sunriseTime];
        
        self.sunsetTime = [[UILabel alloc] initWithFrame: CGRectMake(WIDTH / 2 + 32, 29, WIDTH / 2, 37)];
        self.sunsetTime.text = dic[@"data"][0][@"sunset"];
        self.sunsetTime.textColor = [UIColor whiteColor];
        self.sunsetTime.font = [UIFont systemFontOfSize: 37];
        [cell.contentView addSubview: self.sunsetTime];
        
        return cell;
    } else if (indexPath.row == 5) {
        self.leftTitle = [[UILabel alloc] initWithFrame: CGRectMake(26, 10, 96, 16)];
        self.leftTitle.text = @"能见度";
        self.leftTitle.textColor = [UIColor grayColor];
        self.leftTitle.font = [UIFont systemFontOfSize: 16];
        [cell.contentView addSubview: self.leftTitle];
        
        self.rightTitle = [[UILabel alloc] initWithFrame: CGRectMake(WIDTH / 2 + 32, 10, 96, 16)];
        self.rightTitle.text = @"湿度";
        self.rightTitle.textColor = [UIColor grayColor];
        self.rightTitle.font = [UIFont systemFontOfSize: 16];
        [cell.contentView addSubview: self.rightTitle];
        
        self.sunriseTime = [[UILabel alloc] initWithFrame: CGRectMake(26, 29, WIDTH / 2, 37)];
        self.sunriseTime.text = dic[@"data"][0][@"visibility"];
        self.sunriseTime.textColor = [UIColor whiteColor];
        self.sunriseTime.font = [UIFont systemFontOfSize: 37];
        [cell.contentView addSubview: self.sunriseTime];
        
        self.sunsetTime = [[UILabel alloc] initWithFrame: CGRectMake(WIDTH / 2 + 32, 29, WIDTH / 2, 37)];
        self.sunsetTime.text = dic[@"data"][0][@"humidity"];
        self.sunsetTime.textColor = [UIColor whiteColor];
        self.sunsetTime.font = [UIFont systemFontOfSize: 37];
        [cell.contentView addSubview: self.sunsetTime];
        
        return cell;
    } else if (indexPath.row == 6) {
        self.leftTitle = [[UILabel alloc] initWithFrame: CGRectMake(26, 10, 96, 16)];
        self.leftTitle.text = @"风速";
        self.leftTitle.textColor = [UIColor grayColor];
        self.leftTitle.font = [UIFont systemFontOfSize: 16];
        [cell.contentView addSubview: self.leftTitle];
        
        self.rightTitle = [[UILabel alloc] initWithFrame: CGRectMake(WIDTH / 2 + 32, 10, 96, 16)];
        self.rightTitle.text = @"风速等级";
        self.rightTitle.textColor = [UIColor grayColor];
        self.rightTitle.font = [UIFont systemFontOfSize: 16];
        [cell.contentView addSubview: self.rightTitle];
        
        self.sunriseTime = [[UILabel alloc] initWithFrame: CGRectMake(26, 29, WIDTH / 2, 37)];
        self.sunriseTime.text = dic[@"data"][0][@"win_meter"];
        self.sunriseTime.textColor = [UIColor whiteColor];
        self.sunriseTime.font = [UIFont systemFontOfSize: 37];
        [cell.contentView addSubview: self.sunriseTime];
        
        self.sunsetTime = [[UILabel alloc] initWithFrame: CGRectMake(WIDTH / 2 + 32, 29, WIDTH / 2, 37)];
        self.sunsetTime.text = dic[@"data"][0][@"win_speed"];
        self.sunsetTime.textColor = [UIColor whiteColor];
        self.sunsetTime.font = [UIFont systemFontOfSize: 37];
        [cell.contentView addSubview: self.sunsetTime];
        
        return cell;
    } else if (indexPath.row == 6) {
        self.leftTitle = [[UILabel alloc] initWithFrame: CGRectMake(26, 10, 96, 16)];
        self.leftTitle.text = @"气压";
        self.leftTitle.textColor = [UIColor grayColor];
        self.leftTitle.font = [UIFont systemFontOfSize: 16];
        [cell.contentView addSubview: self.leftTitle];
        
        self.rightTitle = [[UILabel alloc] initWithFrame: CGRectMake(WIDTH / 2 + 32, 10, 96, 16)];
        self.rightTitle.text = @"空气质量";
        self.rightTitle.textColor = [UIColor grayColor];
        self.rightTitle.font = [UIFont systemFontOfSize: 16];
        [cell.contentView addSubview: self.rightTitle];
        
        self.sunriseTime = [[UILabel alloc] initWithFrame: CGRectMake(26, 29, WIDTH / 2, 37)];
        self.sunriseTime.text = dic[@"data"][0][@"pressure"];
        self.sunriseTime.textColor = [UIColor whiteColor];
        self.sunriseTime.font = [UIFont systemFontOfSize: 37];
        [cell.contentView addSubview: self.sunriseTime];
        
        self.sunsetTime = [[UILabel alloc] initWithFrame: CGRectMake(WIDTH / 2 + 32, 29, WIDTH / 2, 37)];
        self.sunsetTime.text = dic[@"data"][0][@"air_level"];
        self.sunsetTime.textColor = [UIColor whiteColor];
        self.sunsetTime.font = [UIFont systemFontOfSize: 37];
        [cell.contentView addSubview: self.sunsetTime];
        
        cell.contentView.backgroundColor = [UIColor systemMintColor];
        return cell;
    } else {
        return cell;
        //return [[UITableViewCell alloc] init];
    }
    
}

- (void)pressCancel {
    self.dicArray = [[NSMutableArray alloc] init];  //要手动初始化？？
    //[self.delegate didDismissNextPageWithInitialization: self.dicArray];
    //[self.dicArray dealloc];
    [self dismissViewControllerAnimated: YES completion: nil];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

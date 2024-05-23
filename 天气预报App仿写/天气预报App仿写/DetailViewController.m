//
//  DetailViewController.m
//  天气预报App仿写
//
//  Created by . on 2023/8/1.
//

#import "DetailViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "DetailTableViewCell.h"
#import "NSMutableArray+ErrorHandle.h"
#import "MainViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView  *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.alpha = 0.80;//设置透明度
    blurEffectView.frame = self.view.frame;
    //self.view.backgroundColor = [UIColor whiteColor];
    [self.view insertSubview: blurEffectView atIndex: 0];
    
    self.cancelButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.cancelButton.frame = CGRectMake(10, 45, 32, 32);
    [self.cancelButton setTintColor: [UIColor whiteColor]];
    [self.cancelButton setImage: [UIImage imageNamed: @"cancel.png"] forState: UIControlStateNormal];
    [self.cancelButton addTarget: self action: @selector(pressCancel) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: self.cancelButton];
    self.addButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.addButton.frame = CGRectMake(WIDTH - 36, 45, 32, 32);
    [self.addButton setTintColor: [UIColor whiteColor]];
    [self.addButton setImage: [UIImage imageNamed: @"tianjia.png"] forState: UIControlStateNormal];
    [self.addButton addTarget: self action: @selector(pressAdd) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: self.addButton];
    
    self.cityName = [[UILabel alloc] init];
    self.cityName.text = [NSString stringWithFormat: @"%@", self.cityNameString];
    self.cityName.textColor = [UIColor whiteColor];
    self.cityName.frame = CGRectMake(22, 95, WIDTH, 55);
    self.cityName.font = [UIFont systemFontOfSize: 36];
    [self.view addSubview: self.cityName];
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 145, WIDTH, HEIGHT * 5 / 7)];
    self.scrollView.contentSize = CGSizeMake(WIDTH / 5 * 7, HEIGHT * 5 / 7);
    self.scrollView.scrollEnabled = YES;
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview: self.scrollView];
    self.scrollView.alpha = 0.85;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
//    if (!self.weatherimgData) self.weatherimgData = [[NSMutableArray alloc] init];
    //if (!self.cityData) self.cityData = [[NSMutableArray alloc] init];
//    if (!self.temData) self.temData = [[NSMutableArray alloc] init];
    self.dayData = [[NSMutableArray alloc] init];
    self.dateData = [[NSMutableArray alloc] init];
    self.weaIcon = [[NSMutableArray alloc] init];
    self.wea = [[NSMutableArray alloc] init];
    self.tem1Data = [[NSMutableArray alloc] init];
    self.tem2Data = [[NSMutableArray alloc] init];
    self.weaNight = [[NSMutableArray alloc] init];
    self.weaNightIcon = [[NSMutableArray alloc] init];
    self.airLevel = [[NSMutableArray alloc] init];
    self.winSpeed = [[NSMutableArray alloc] init];
    
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, WIDTH / 5 * 7, HEIGHT * 5 / 7) style: UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.scrollEnabled = NO;
    [self.tableView registerClass: [DetailTableViewCell class] forCellReuseIdentifier: @"detail1"];
    [self.tableView registerClass: [DetailTableViewCell class] forCellReuseIdentifier: @"detail2"];
    [self.tableView registerClass: [DetailTableViewCell class] forCellReuseIdentifier: @"detail3"];
    [self.tableView registerClass: [DetailTableViewCell class] forCellReuseIdentifier: @"detail4"];
    [self.tableView registerClass: [DetailTableViewCell class] forCellReuseIdentifier: @"detail5"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.scrollView addSubview: self.tableView];
    
    [self createUrl];

    
//    self.dayData = [[NSMutableArray alloc] initWithObjects: @"周三", @"周四", @"周五", @"周六", @"周日", @"周一", @"周二", nil];
//    self.dateData = [[NSMutableArray alloc] initWithObjects: @"1", @"2", @"3", @"4", @"5", @"6", @"7", nil];
//    self.weaIcon = [[NSMutableArray alloc] initWithObjects: @"lei", @"qing", @"shachen", @"wu", @"xiaoyu", @"xue", @"yun", nil];
//    self.wea = [[NSMutableArray alloc] initWithObjects: @"雷", @"晴", @"沙尘", @"雾", @"小雨", @"雪", @"云", nil];
//    self.tem1Data = [[NSMutableArray alloc] initWithObjects: @"22", @"22", @"11", @"21", @"34", @"22", @"32", nil];
//    self.tem2Data = [[NSMutableArray alloc] initWithObjects: @"23", @"32", @"34", @"54", @"65", @"54", @"54", nil];
//    self.weaNight = [[NSMutableArray alloc] initWithObjects: @"雷", @"晴", @"沙尘", @"雾", @"小雨", @"雪", @"云", nil];
//    self.weaNightIcon = [[NSMutableArray alloc] initWithObjects: @"lei", @"qing", @"shachen", @"wu", @"xiaoyu", @"xue", @"yun", nil];
//    self.airLevel = [[NSMutableArray alloc] initWithObjects: @"优", @"良", @"轻度污染", @"中度污染", @"重度污染", @"严重污染", @"优秀", nil];
//    self.winSpeed = [[NSMutableArray alloc] initWithObjects: @"<3", @">3", @">4", @">5", @"<5", @"<3", @"<6", nil];



}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dayData.count; //5？？？
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        return HEIGHT * 5 / 21;
    } else {
        return HEIGHT * 5 / 42;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTableViewCell* cell1 = [self.tableView dequeueReusableCellWithIdentifier: @"detail1"];
    DetailTableViewCell* cell2 = [self.tableView dequeueReusableCellWithIdentifier: @"detail2"];
    DetailTableViewCell* cell3 = [self.tableView dequeueReusableCellWithIdentifier: @"detail3"];
    DetailTableViewCell* cell4 = [self.tableView dequeueReusableCellWithIdentifier: @"detail4"];
    DetailTableViewCell* cell5 = [self.tableView dequeueReusableCellWithIdentifier: @"detail5"];
    
    if (indexPath.row == 0) {
        for (int i = 0; i < 7; ++i) {
            UILabel* dayLabel = [[UILabel alloc] init];
            dayLabel.frame = CGRectMake(WIDTH / 5 * i, 0, WIDTH / 5, HEIGHT * 5 / 42);
            dayLabel.text = self.dayData[i];
            dayLabel.textColor = [UIColor darkGrayColor];
            dayLabel.textAlignment = NSTextAlignmentCenter;
            [cell1.contentView addSubview: dayLabel];
            UILabel* dateLabel = [[UILabel alloc] init];
            dateLabel.frame = CGRectMake(WIDTH / 5 * i, 25, WIDTH / 5, HEIGHT * 5 / 42);
            dateLabel.text = self.dateData[i];
            dateLabel.textColor = [UIColor lightGrayColor];
            dateLabel.font = [UIFont systemFontOfSize: 15];
            dateLabel.textAlignment = NSTextAlignmentCenter;
            [cell1.contentView addSubview: dateLabel];
        }
        return cell1;
    } else if (indexPath.row == 1) {
        for (int i = 0; i < 7; ++i) {
            UIImageView* iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: [NSString stringWithFormat: @"%@Icon.png", self.weaIcon[i]]]];
            iView.frame = CGRectMake((WIDTH / 5 / 2 - 16) + (WIDTH / 5) * i, 0, 32, 32);
            [cell2.contentView addSubview: iView];
            UILabel* wea = [[UILabel alloc] init];
            wea.frame = CGRectMake(WIDTH / 5 * i, 0, WIDTH / 5, HEIGHT * 5 / 42);
            wea.text = self.wea[i];
            wea.textColor = [UIColor darkGrayColor];
            wea.textAlignment = NSTextAlignmentCenter;
            [cell2.contentView addSubview: wea];
        }
        return cell2;
    } else if (indexPath.row == 2) {
        for (int i = 0; i < 7; ++i) {
            UILabel* tem1Label = [[UILabel alloc] init];
            tem1Label.frame = CGRectMake(WIDTH / 5 * i, -20, WIDTH / 5, HEIGHT * 5 / 42);
            tem1Label.text = [NSString stringWithFormat: @"%@˚", self.tem1Data[i]];
            tem1Label.font = [UIFont boldSystemFontOfSize: 20];
            tem1Label.textAlignment = NSTextAlignmentCenter;
            [cell3.contentView addSubview: tem1Label];
            UILabel* tem2Label = [[UILabel alloc] init];
            tem2Label.frame = CGRectMake(WIDTH / 5 * i, 75, WIDTH / 5, HEIGHT * 5 / 42);
            tem2Label.text = [NSString stringWithFormat: @"%@˚", self.tem2Data[i]];
            tem2Label.font = [UIFont boldSystemFontOfSize: 20];
            tem2Label.textAlignment = NSTextAlignmentCenter;
            [cell3.contentView addSubview: tem2Label];
        }
        return cell3;
    } else if (indexPath.row == 3) {
        for (int i = 0; i < 7; ++i) {
            UIImageView* iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: [NSString stringWithFormat: @"%@Icon.png", self.weaNightIcon[i]]]];
            iView.frame = CGRectMake((WIDTH / 5 / 2 - 16) + (WIDTH / 5) * i, 0, 32, 32);
            [cell4.contentView addSubview: iView];
            UILabel* weaNight = [[UILabel alloc] init];
            weaNight.frame = CGRectMake(WIDTH / 5 * i, 0, WIDTH / 5, HEIGHT * 5 / 42);
            weaNight.text = self.weaNight[i];
            weaNight.textColor = [UIColor darkGrayColor];
            weaNight.textAlignment = NSTextAlignmentCenter;
            [cell4.contentView addSubview: weaNight];
        }
        return cell4;
    } else if (indexPath.row == 4) {
        for (int i = 0; i < 7; ++i) {
//            UILabel* dateLabel = [[UILabel alloc] init];
//            dateLabel.frame = CGRectMake(WIDTH / 5 * i, 0, WIDTH / 5, HEIGHT * 5 / 42);
//            dateLabel.text = self.winSpeed[i];
//            dateLabel.textColor = [UIColor lightGrayColor];
//            dateLabel.font = [UIFont systemFontOfSize: 15];
//            dateLabel.textAlignment = NSTextAlignmentCenter;
//            [cell1.contentView addSubview: dateLabel];
            UIImageView* iView = [[UIImageView alloc] init];
            UILabel* airL = [[UILabel alloc] init];
            airL.text = self.airLevel[i];
            airL.textAlignment = NSTextAlignmentCenter;
            UILabel* winS = [[UILabel alloc] init];
            winS.text = self.winSpeed[i];
            winS.textAlignment = NSTextAlignmentCenter;
            //优,良,轻度污染,中度污染,重度污染,严重污染  //绿 黄 橙 红 紫 褐
            if ([airL.text isEqualToString: @"优"]) {
                iView.backgroundColor = [UIColor greenColor];
                iView.alpha = 0.05;
                airL.textColor = [UIColor greenColor];
            } else if ([airL.text isEqualToString: @"良"]) {
                iView.backgroundColor = [UIColor systemYellowColor];
                iView.alpha = 0.05;
                airL.textColor = [UIColor systemYellowColor];
            } else if ([airL.text isEqualToString: @"轻度污染"]) {
                iView.backgroundColor = [UIColor orangeColor];
                iView.alpha = 0.05;
                airL.textColor = [UIColor orangeColor];
            } else if ([airL.text isEqualToString: @"中度污染"]) {
                iView.backgroundColor = [UIColor redColor];
                iView.alpha = 0.05;
                airL.textColor = [UIColor redColor];
            } else if ([airL.text isEqualToString: @"重度污染"]) {
                iView.backgroundColor = [UIColor purpleColor];
                iView.alpha = 0.05;
                airL.textColor = [UIColor purpleColor];
            } else if ([airL.text isEqualToString: @"严重污染"]) {
                iView.backgroundColor = [UIColor brownColor];
                iView.alpha = 0.05;
                airL.textColor = [UIColor brownColor];
            }
            
            //airL.frame = CGRectMake(32 - (WIDTH / 5 / 2), 12 - 12, WIDTH / 5, 24);
            airL.frame = CGRectMake((WIDTH / 5 / 2 - 32) + (WIDTH / 5) * i, 20, 64, 24);
            airL.font = [UIFont systemFontOfSize: 13];
            iView.frame = CGRectMake((WIDTH / 5 / 2 - 32) + (WIDTH / 5) * i, 20, 64, 24);
            iView.layer.cornerRadius = 11.0;
            iView.layer.masksToBounds = YES;
            winS.frame = CGRectMake((WIDTH / 5 / 2 - 32) + (WIDTH / 5) * i, -5, 64, 24);
            winS.font = [UIFont systemFontOfSize: 15];
            winS.textColor = [UIColor grayColor];
            //((WIDTH / 5 / 2 - 16) + (WIDTH / 5) * i, 0, 32, 32)
            [cell5.contentView addSubview: iView];
            [cell5.contentView addSubview: airL];
            [cell5.contentView addSubview: winS];
            
        }
        return cell5;
    } else {
        return [[UITableViewCell alloc]init];;  //nil？？
    }
}


- (void)createUrl {
    //for (int i = 0; i < self.cityData.count; ++i) {
    //https://v0.yiketianqi.com/api?unescape=1&version=v9&appid=63638618&appsecret=ewmOULc3
    NSString* originalString = self.cityNameString;
    NSInteger stringLength = originalString.length;
    if (stringLength > 0) {
        NSRange range = NSMakeRange(stringLength - 1, 1);
        self.updatedCityNameString = [[NSString alloc] init];
        self.updatedCityNameString = [originalString stringByReplacingCharactersInRange:range withString:@""];
    }
        NSString* urlString = [NSString stringWithFormat:@"https://v0.yiketianqi.com/api?unescape=1&version=v9&appid=72961936&appsecret=m78Z0m2T&city=%@", self.updatedCityNameString];
    //NSLog(@"%@", self.cityNameString);
        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL* url = [NSURL URLWithString:urlString];
        
        NSURLSession* session = [NSURLSession sharedSession];
        
        NSURLSessionTask* dataTask = [session dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                self.dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                //NSLog(@"%@",[self convertToJsonData:dic]);
                
            
//                NSMutableString *stringCity = [NSMutableString stringWithFormat:@"%@",dic[@"city"]];
//                NSMutableString *stringTemprature = [NSMutableString stringWithFormat:@"%@°C",dic[@"data"][0][@"tem"]];
//                NSMutableString *stringWeather = [NSMutableString stringWithFormat:@"%@",dic[@"data"][0][@"wea_img"]];
//                NSLog(@"%@", dic[@"data"][1][@"day"]);
//                NSLog(@"%@", dic[@"data"][1][@"date"]);
//                NSLog(@"%@", dic[@"data"][1][@"wea_day_img"]);
//                NSLog(@"%@", dic[@"data"][1][@"wea_day"]);
//                NSLog(@"%@", dic[@"data"][1][@"tem1"]);
//                NSLog(@"%@", dic[@"data"][1][@"tem2"]);
//                NSLog(@"%@", dic[@"data"][1][@"wea_night"]);
//                NSLog(@"%@", dic[@"data"][1][@"wea_night_img"]);
//                NSLog(@"%@", dic[@"data"][1][@"win_speed"]);
//                NSLog(@"%@", dic[@"data"][1][@"air_level"]);

                
                for (int i = 0; i < 7; ++i) {
                    
//                    [self.dayData addObject: dic[@"data"][i][@"day"]];
//                    [self.dateData addObject: dic[@"data"][i][@"date"]];
//                    [self.weaIcon addObject: dic[@"data"][i][@"wea_day_img"]];
//                    [self.wea addObject: dic[@"data"][i][@"wea_day"]];
//                    [self.tem1Data addObject: dic[@"data"][i][@"tem1"]];
//                    [self.tem2Data addObject: dic[@"data"][i][@"tem2"]];
//                    [self.weaNight addObject: dic[@"data"][i][@"wea_night"]];
//                    [self.weaNightIcon addObject: dic[@"data"][i][@"wea_night_img"]];
//                    [self.winSpeed addObject: dic[@"data"][i][@"win_speed"]];
//                    [self.airLevel addObject: dic[@"data"][i][@"air_level"]];
                    
                    
                    [self.dayData addObjectVerify: self.dic[@"data"][i][@"week"]];
                    [self.dateData addObjectVerify: self.dic[@"data"][i][@"date"]];
                    [self.weaIcon addObjectVerify: self.dic[@"data"][i][@"wea_day_img"]];
                    [self.wea addObjectVerify: self.dic[@"data"][i][@"wea_day"]];
                    [self.tem1Data addObjectVerify: self.dic[@"data"][i][@"tem1"]];
                    [self.tem2Data addObjectVerify: self.dic[@"data"][i][@"tem2"]];
                    [self.weaNight addObjectVerify: self.dic[@"data"][i][@"wea_night"]];
                    [self.weaNightIcon addObjectVerify: self.dic[@"data"][i][@"wea_night_img"]];
                    [self.winSpeed addObjectVerify: self.dic[@"data"][i][@"win_speed"]];
                    [self.airLevel addObjectVerify: self.dic[@"data"][i][@"air_level"]];

                }
                
                //[self.cityData addObject: dic[@"city"]];
                //NSLog(@"%@", dic[@"city"]);
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    //NSLog(@"dic = %@", dic);
                    [self->_tableView reloadData];
                }];
            }
        }];
        [dataTask resume];
    //}
}

- (void)pressCancel {
    [self dismissViewControllerAnimated: YES completion: nil];
}

- (void)pressAdd {
    int flag = 1;
    for (int i = 0; i < self.cityData.count; i++) {
        if ([self.cityData[i] isEqualToString: self.updatedCityNameString]) {
            
            flag = 0;
            break;
        }
        
    }
    if (flag == 0) {
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle: @"提示" message:@"该城市已添加" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle: @"确定" style:UIAlertActionStyleDefault handler: nil];
        [alertController addAction: sure];
        [self presentViewController: alertController animated: YES completion: nil];
    } else {
        [self.cityData addObject: self.updatedCityNameString];
        [self.timeData addObject: self.dic[@"data"][0][@"tem"]];
        [self.weatherimgData addObject: self.dic[@"data"][0][@"wea_img"]];
//        for (int i = 0; i < self.cityData.count; i++) {
//            NSLog(@"%@", self.cityData[i]);
//        }
        

        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys: self.cityData, @"cityData", self.timeData, @"timeData", self.weatherimgData, @"weatherimgData",nil];
        
        //发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName: @"1" object:nil userInfo: dictionary];
        [self dismissViewControllerAnimated: YES completion: nil];
    }
}

//-(NSString *)convertToJsonData:(id )dict
//{
//    if (![dict isKindOfClass:[NSDictionary class]] && ![dict isKindOfClass:[NSArray class]]) {
//        return @"{@\"error\":@\"json格式错误\"}";
//    }
//    NSError *error;
//    NSData *jsonData;
//    if (@available(iOS 11.0, *)) {
//        jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingSortedKeys error:&error];
//    } else {
//        jsonData = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
//    }
//    NSString *jsonString;
//    if (!jsonData) {
//        NSLog(@"%@",error);
//    }else{
//        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
//    }
//    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
//    return mutStr;
//}

@end

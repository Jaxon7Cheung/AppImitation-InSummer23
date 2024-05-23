//
//  ViewController.m
//  NSDictionaryTestssss
//
//  Created by 张旭洋 on 2023/8/2.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *dic = @{
        @"code": @(1),
        @"data": @[
            @{
                @"code": @"140000",
                @"name": @"山西省",
                @"pchilds": @[
                    @{
                        @"cchilds": @[
                            @{@"code": @"140105", @"name": @"小店区"},
                            @{@"code": @"140106", @"name": @"迎泽区"},
                            @{@"code": @"140107", @"name": @"杏花岭区"},
                            @{@"code": @"140108", @"name": @"尖草坪区"},
                            @{@"code": @"140109", @"name": @"万柏林区"},
                            @{@"code": @"140110", @"name": @"晋源区"},
                            @{@"code": @"140121", @"name": @"清徐县"},
                            @{@"code": @"140122", @"name": @"阳曲县"},
                            @{@"code": @"140123", @"name": @"娄烦县"},
                            @{@"code": @"140171", @"name": @"山西转型综合改革示范区"},
                            @{@"code": @"140181", @"name": @"古交市"}
                        ],
                        @"code": @"140100",
                        @"name": @"太原市"
                    },
                    @{
                        @"cchilds": @[
                            @{@"code": @"140212", @"name": @"新荣区"},
                            @{@"code": @"140213", @"name": @"平城区"},
                            @{@"code": @"140214", @"name": @"云冈区"},
                            @{@"code": @"140215", @"name": @"云州区"},
                            @{@"code": @"140221", @"name": @"阳高县"},
                            @{@"code": @"140222", @"name": @"天镇县"},
                            @{@"code": @"140223", @"name": @"广灵县"},
                            @{@"code": @"140224", @"name": @"灵丘县"},
                            @{@"code": @"140225", @"name": @"浑源县"},
                            @{@"code": @"140226", @"name": @"左云县"},
                            @{@"code": @"140271", @"name": @"山西大同经济开发区"}
                        ],
                        @"code": @"140200",
                        @"name": @"大同市"
                    },
                    @{
                        @"cchilds": @[
                            @{@"code": @"140302", @"name": @"城区"},
                            @{@"code": @"140303", @"name": @"矿区"},
                            @{@"code": @"140311", @"name": @"郊区"},
                            @{@"code": @"140321", @"name": @"平定县"},
                            @{@"code": @"140322", @"name": @"盂县"}
                        ],
                        @"code": @"140300",
                        @"name": @"阳泉市"
                    },
                    @{
                        @"cchilds": @[
                            @{@"code": @"140403", @"name": @"潞州区"},
                            @{@"code": @"140404", @"name": @"上党区"},
                            @{@"code": @"140405", @"name": @"屯留区"},
                            @{@"code": @"140406", @"name": @"潞城区"},
                            @{@"code": @"140423", @"name": @"襄垣县"},
                            @{@"code": @"140425", @"name": @"平顺县"},
                            @{@"code": @"140426", @"name": @"黎城县"},
                            @{@"code": @"140427", @"name": @"壶关县"},
                            @{@"code": @"140428", @"name": @"长子县"},
                            @{@"code": @"140429", @"name": @"武乡县"},
                            @{@"code": @"140430", @"name": @"沁县"},
                            @{@"code": @"140431", @"name": @"沁源县"},
                            @{@"code": @"140471", @"name": @"山西长治高新技术产业园区"}
                        ],
                        @"code": @"140400",
                        @"name": @"长治市"
                    }
                ]
            }
        ]
    };
    
    //NSLog(@"%@", dataDict[@"data"][0][@"pchilds"][0][@"name"]);
    //NSLog(@"%@", dataDict[@"data"][0][@"pchilds"][0][@"cchilds"][1][@"name"]);

    
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
    [self createUrl];
    
}


- (void)createUrl {
    //for (int i = 0; i < self.cityData.count; ++i) {
    //https://v0.yiketianqi.com/api?unescape=1&version=v9&appid=63638618&appsecret=ewmOULc3
        NSString* urlString = [NSString stringWithFormat:@"https://v0.yiketianqi.com/api?unescape=1&version=v9&appid=63638618&appsecret=ewmOULc3&city=北京"/*, self.cityData[i]*/];
        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL* url = [NSURL URLWithString:urlString];
        
        NSURLSession* session = [NSURLSession sharedSession];
        
        NSURLSessionTask* dataTask = [session dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                
//                NSMutableString *stringCity = [NSMutableString stringWithFormat:@"%@",dic[@"city"]];
//                NSMutableString *stringTemprature = [NSMutableString stringWithFormat:@"%@°C",dic[@"data"][0][@"tem"]];
//                NSMutableString *stringWeather = [NSMutableString stringWithFormat:@"%@",dic[@"data"][0][@"wea_img"]];

                
                for (int i = 0; i < 7; ++i) {
                    [self.dayData addObject: dic[@"data"][i][@"day"]];
                    [self.dateData addObject: dic[@"data"][i][@"date"]];
                    [self.weaIcon addObject: dic[@"data"][i][@"wea_day_img"]];
                    [self.wea addObject: dic[@"data"][i][@"wea_day"]];
                    [self.tem1Data addObject: dic[@"data"][i][@"tem1"]];
                    [self.tem2Data addObject: dic[@"data"][i][@"tem2"]];
                    [self.weaNight addObject: dic[@"data"][i][@"wea_night"]];
                    [self.weaNightIcon addObject: dic[@"data"][i][@"wea_night_img"]];
                    [self.winSpeed addObject: dic[@"data"][i][@"win_speed"]];
                    [self.airLevel addObject: dic[@"data"][i][@"air_level"]];
//                    NSLog(@"%@", dic[@"data"][i][@"day"]);
//                    NSLog(@"%@", dic[@"data"][i][@"date"]);
//                    NSLog(@"%@", dic[@"data"][i][@"wea_day_img"]);
//                    NSLog(@"%@", dic[@"data"][i][@"wea_day"]);
//                    NSLog(@"%@", dic[@"data"][i][@"tem1"]);
//                    NSLog(@"%@", dic[@"data"][i][@"tem2"]);
//                    NSLog(@"%@", dic[@"data"][i][@"wea_night"]);
//                    NSLog(@"%@", dic[@"data"][i][@"wea_night_img"]);
//                    NSLog(@"%@", dic[@"data"][i][@"win_speed"]);
//                    NSLog(@"%@", dic[@"data"][i][@"air_level"]);
                    NSLog(@"%@111", self.dayData[i]);
                    NSLog(@"%@111", self.dateData[i]);
                    NSLog(@"%@111", self.wea[i]);
                    NSLog(@"%@111", self.weaIcon[i]);
                    NSLog(@"%@111", self.tem1Data[i]);
                    NSLog(@"%@111", self.tem2Data[i]);
                    NSLog(@"%@111", self.weaNight[i]);
                    NSLog(@"%@111", self.weaNightIcon[i]);
                    NSLog(@"%@111", self.winSpeed[i]);
                    NSLog(@"%@111", self.airLevel[i]);
                }

                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    //NSLog(@"dic = %@", dic);
                    //[self->_tableView reloadData];
                }];
            }
        }];
        [dataTask resume];
    //}
}

@end

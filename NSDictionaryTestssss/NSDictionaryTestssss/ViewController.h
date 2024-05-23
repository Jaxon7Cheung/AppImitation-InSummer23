//
//  ViewController.h
//  NSDictionaryTestssss
//
//  Created by 张旭洋 on 2023/8/2.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

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

@property (nonatomic, strong)UIScrollView* smallScrollView;
@property (nonatomic, strong)UILabel* tmpTimeData;
@property (nonatomic, strong)UILabel* weaIconData;
@property (nonatomic, strong)UILabel* tmpTemData;


@end


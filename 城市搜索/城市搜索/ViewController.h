//
//  ViewController.h
//  城市搜索
//
//  Created by 张旭洋 on 2023/8/1.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<
NSURLSessionDelegate
>
 
// 接收城市ID
@property (nonatomic, strong) NSString* cityID;
 
// 接收返回的数据
@property (nonatomic, strong) NSMutableData* data;
@property (nonatomic, strong) NSDictionary* mainDictionary;
 
@end



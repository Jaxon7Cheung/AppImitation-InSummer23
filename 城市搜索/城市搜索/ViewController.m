//
//  ViewController.m
//  城市搜索
//
//  Created by 张旭洋 on 2023/8/1.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _cityID = @"";
    [self createUrl];
    
}
//https://v0.yiketianqi.com/api?appid=17628316&appsecret=QrgKcZ8B&version=v9&city=%@&unescape=1
//https://v0.yiketianqi.com/api?unescape=1&version=v61&appid=63638618&appsecret=ewmOULc3&city=%@
//unescape=1??
- (void) createUrl {
    // 地址（我这里的cityID是外部传进来的字符串，代表查询城市的id）
    NSString* urlString = [NSString stringWithFormat:@"https://v0.yiketianqi.com/api?unescape=1&version=v61&appid=63638618&appsecret=ewmOULc3&city=%@&unescape=1", _cityID];
    
    // 对中文和空格字符编码解码
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    // 设置请求地址
    NSURL* url = [NSURL URLWithString:urlString];
    
    // 创建请求类
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    // 创建会话
    NSURLSession* seesion = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // 根据会话创建任务
    NSURLSessionTask* dataTask = [seesion dataTaskWithRequest:request];
    
    // 启动任务
    [dataTask resume];
}


// URL协议方法
 
// 接收的服务器的响应
- (void) URLSession:(NSURLSession*)session dataTask:(nonnull NSURLSessionDataTask *)dataTask didReceiveResponse:(nonnull NSURLResponse *)response completionHandler:(nonnull void (^)(NSURLSessionResponseDisposition))completionHandler {
    
    // 判断data是否使用过
    if (self.data == nil) {
        // 未使用过初始化data
        self.data = [[NSMutableData alloc] init];
    } else {
        // 使用过清空上次使用的数据
        self.data.length = 0;
    }
    // 允许接收数据
    completionHandler(NSURLSessionResponseAllow);
}
 
// 接收数据时调用，会被调用多次
- (void) URLSession:(NSURLSession*)session dataTask:(nonnull NSURLSessionDataTask *)dataTask didReceiveData:(nonnull NSData *)data {
    // 拼接数据
    [self.data appendData: data];
}
 
// 数据请求完成 或请求出现错误时调用
- (void) URLSession:(NSURLSession*)session task:(nonnull NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    
    // 请求成功
    if (error == nil) {
        // 解析数据，将data转换成OC对象，返回的是一个字典
        // 用于接收的字典我在别的方法内已经初始化。若没有初始化字典，接收到的永远都是空值。
        _mainDictionary = [NSJSONSerialization JSONObjectWithData:_data options:kNilOptions error:nil];
    } else {
        // 请求失败，打印错误
        NSLog(@"%@", error);
    }
    
    // 回到主线程（进行其他操作）
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        // 打印接收到的字典，确认请求是否成功
        NSLog(@"dict = %@", self->_mainDictionary);
    }];
}



@end

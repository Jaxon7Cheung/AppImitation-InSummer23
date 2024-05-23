//
//  MessageSettingViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/30.
//

#import "MessageSettingViewController.h"

@interface MessageSettingViewController ()

@end

@implementation MessageSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    UIBarButtonItem* btn1 = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"holidayfanhui.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressReturn)];
    UIBarButtonItem* btn2 = [[UIBarButtonItem alloc] initWithTitle: @"消息设置" menu: nil];
    [self.navigationItem setLeftBarButtonItems: [NSArray arrayWithObjects: btn1, btn2, nil]];
    btn1.tintColor = [UIColor whiteColor];
    btn2.tintColor = [UIColor whiteColor];




    NSArray *labelarray = [NSArray arrayWithObjects:@"接受新消息通知", @"通知显示栏", @"声音", @"震动", @"关注更新", nil];
    for (int i = 0; i < 5; i++) {
        
        
        UILabel* label = [[UILabel alloc] init];
        label.frame = CGRectMake(20, 110 + 50 * i, 200, 30);
        label.text = labelarray[i];
        [self.view addSubview: label];
        
        UIButton* button = [[UIButton alloc] init];
        button.frame = CGRectMake(350, 115 + 50 * i, 20, 20);
        [button setImage: [UIImage imageNamed:@"no.png"] forState: UIControlStateNormal];
        button.tag = i + 1;
        [self.view addSubview: button];
        [button addTarget: self action: @selector(pressButton:) forControlEvents: UIControlEventTouchUpInside];
    }
}


- (void)pressButton:(UIButton *)button {
    if (button.tag < 10) {
        [button setImage: [UIImage imageNamed: @"yes.png"] forState: UIControlStateNormal];
        button.tag += 20;
    } else {
        [button setImage: [UIImage imageNamed: @"no.png"] forState: UIControlStateNormal];
        button.tag -= 20;
    }
}

- (void)pressReturn {
    [self.navigationController popViewControllerAnimated: YES];
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

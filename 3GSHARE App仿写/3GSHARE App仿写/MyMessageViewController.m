//
//  MyMessageViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/30.
//

#import "MyMessageViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "NewSubscribeViewController.h"
#import "ChatViewController.h"


@interface MyMessageViewController ()

@end

@implementation MyMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    UIBarButtonItem* btn1 = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"holidayfanhui.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressReturn)];
    UIBarButtonItem* btn2 = [[UIBarButtonItem alloc] initWithTitle: @"我的信息" menu: nil];
    [self.navigationItem setLeftBarButtonItems: [NSArray arrayWithObjects: btn1, btn2, nil]];
    btn1.tintColor = [UIColor whiteColor];
    btn2.tintColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    self.tableView.bounces = NO;
    [self.view addSubview: self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
        
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier: @"mymessage"];
        
    self.informationArray = [NSArray arrayWithObjects: @"评论", @"我的推荐", @"新关注的", @"私信", @"活动通知", nil];
    self.informationNumberArray = [NSArray arrayWithObjects: @"   7", @"   9", @"   5", @"   4", @"   1", nil];
    }

    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return 1;
    }

    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return 5;
    }

    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 60;
    }

    - (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier: @"mymessage" forIndexPath: indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = self.informationArray[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize: 17];
        UIButton* moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreButton setImage:[UIImage imageNamed: @"sanjiao.png"] forState: UIControlStateNormal];
        [moreButton setTitleColor:[UIColor colorWithRed: 0.2 green: 0.6 blue: 0.9 alpha: 1] forState:UIControlStateNormal];
        [moreButton setTitle: self.informationNumberArray[indexPath.row] forState: UIControlStateNormal];
        moreButton.frame = CGRectMake(290, 20, 60, 20);
        moreButton.enabled = NO;
        [cell.contentView addSubview: moreButton];
        return cell;
    }

    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        if (indexPath.row == 2) {
            if (!self.subscribeViewController) self.subscribeViewController = [[NewSubscribeViewController alloc] init];
            [self.navigationController pushViewController: self.subscribeViewController animated: YES];
        } else if (indexPath.row == 3) {
            ChatViewController* chatViewController = [[ChatViewController alloc] init];
            chatViewController.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController: chatViewController animated: YES completion: nil];
        } else {
            UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"提示" message:@"目前没有新内容！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [boomAlert addAction:boomAction];
            [self presentViewController:boomAlert animated:YES completion:nil];
        }
    }

- (void)pressReturn {
    [self.navigationController popViewControllerAnimated: YES];
}

//-(void)loadView{
//    [super loadView];
//}
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//}
//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//}
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//}
//-(void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
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

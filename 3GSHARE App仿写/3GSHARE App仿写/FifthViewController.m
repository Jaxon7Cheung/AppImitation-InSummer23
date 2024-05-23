//
//  FifthViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/26.
//

#import "FifthViewController.h"
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "PersonTableViewCell.h"
#import "UploadViewController.h"
#import "RecommendViewController.h"
#import "SettingViewController.h"
#import "MyMessageViewController.h"

@interface FifthViewController ()

@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"个人信息";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize: 26];
    self.navigationItem.titleView = titleLabel;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview: self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
        
    [self.tableView registerClass: [PersonTableViewCell class] forCellReuseIdentifier: @"first"];
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier: @"second"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 6;
    } else {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 150;
    } else if (indexPath.section == 1) {
        return 60;
    } else {
        return 0;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        PersonTableViewCell* personalFirstCell = [self.tableView dequeueReusableCellWithIdentifier: @"first" forIndexPath: indexPath];
        return personalFirstCell;
    } else {
        UITableViewCell* personalSecondCell = [self.tableView dequeueReusableCellWithIdentifier: @"second" forIndexPath: indexPath];
        NSArray* personalArray = [NSArray arrayWithObjects:@"我上传的", @"我的信息", @"我推荐的", @"院系通知", @"设置", @"退出", nil];
        personalSecondCell.textLabel.text = personalArray[indexPath.row];
        personalSecondCell.imageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"p%lu.png", indexPath.row + 1]];
        personalSecondCell.accessoryView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"sanjiao.png"]];
        
        return personalSecondCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            UploadViewController*  uploadViewController = [[UploadViewController alloc] init];
            [self.navigationController pushViewController: uploadViewController animated: YES];
        } else if (indexPath.row == 1) {
            MyMessageViewController* myMessageViewController = [[MyMessageViewController alloc] init];
            [self.navigationController pushViewController: myMessageViewController animated: YES];
        } else if (indexPath.row == 2) {
            RecommendViewController*  recommendViewController = [[RecommendViewController alloc] init];
            [self.navigationController pushViewController: recommendViewController animated: YES];
        } else if (indexPath.row == 3) {
            UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle: @"提示" message: @"您目前没有通知" preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction* boomAction = [UIAlertAction actionWithTitle: @"确定" style:UIAlertActionStyleDefault handler: nil];
            [boomAlert addAction: boomAction];
            [self presentViewController: boomAlert animated: YES completion: nil];
        } else if (indexPath.row == 4) {
            SettingViewController*  settingViewController = [[SettingViewController alloc]init];
            [self.navigationController pushViewController:settingViewController animated:YES];
        }
    }
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

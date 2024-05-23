//
//  SettingViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/29.
//

#import "SettingViewController.h"
#import "BasicInformationViewController.h"
#import "PassModifiedViewController.h"
#import "MessageSettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    UIBarButtonItem* btn1 = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"holidayfanhui.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressReturn)];
    UIBarButtonItem* btn2 = [[UIBarButtonItem alloc] initWithTitle: @"设置" menu: nil];
    [self.navigationItem setLeftBarButtonItems: [NSArray arrayWithObjects: btn1, btn2, nil]];
    btn1.tintColor = [UIColor whiteColor];
    btn2.tintColor = [UIColor whiteColor];
    
    
    self.settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style: UITableViewStylePlain];
    [self.view addSubview: self.settingTableView];
    self.settingTableView.delegate = self;
    self.settingTableView.dataSource = self;
    
    [self.settingTableView registerClass:[UITableViewCell class] forCellReuseIdentifier: @"information"];
    
    self.settingArray = [NSArray arrayWithObjects: @"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓存", nil];
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
    UITableViewCell* cell = [self.settingTableView dequeueReusableCellWithIdentifier: @"information" forIndexPath: indexPath];
    cell.textLabel.text = self.settingArray[indexPath.row];
    UIButton* moreButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [moreButton setImage: [UIImage imageNamed: @"sanjiao.png"] forState: UIControlStateNormal];
    moreButton.frame = CGRectMake(290, 20, 60, 20);
    moreButton.enabled = NO;
    [cell.contentView addSubview: moreButton];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        BasicInformationViewController* basicInformationViewController = [[BasicInformationViewController alloc] init];
        [self.navigationController pushViewController: basicInformationViewController animated: YES];
    } else if (indexPath.row == 1) {
        PassModifiedViewController* passModifiedViewController = [[PassModifiedViewController alloc] init];
        [self.navigationController pushViewController: passModifiedViewController animated: YES];
    } else if (indexPath.row == 2) {
        if (!self.messageSettingViewController) self.messageSettingViewController = [[MessageSettingViewController alloc] init];
        [self.navigationController pushViewController: self.messageSettingViewController animated: YES];
    } else if (indexPath.row == 4) {
        self.alertController = [UIAlertController alertControllerWithTitle: @"" message: @"缓存已清除" preferredStyle: UIAlertControllerStyleAlert];
        NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval: 2.0   target: self selector: @selector(timeOut) userInfo: nil repeats: NO];
        [self presentViewController: self.alertController animated: YES completion: nil];
    }
}

- (void)timeOut{
    [self.alertController dismissViewControllerAnimated: YES completion:nil];
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

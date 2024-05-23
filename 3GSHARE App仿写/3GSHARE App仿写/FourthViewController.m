//
//  FourthViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/26.
//

#import "FourthViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "ActivityTableViewCell.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1.0];
    
    self.tableView = [[UITableView alloc] initWithFrame:  CGRectMake(WIDTH / 2 - 185, 25, 370, HEIGHT * 1.15 - 220) style: UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview: self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView registerClass: [ActivityTableViewCell class] forCellReuseIdentifier: @"activity1"];
    [self.tableView registerClass: [ActivityTableViewCell class] forCellReuseIdentifier: @"activity2"];
    [self.tableView registerClass: [ActivityTableViewCell class] forCellReuseIdentifier: @"activity3"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UITableViewHeaderFooterView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* view = [[UITableViewHeaderFooterView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityTableViewCell* cell01 = [self.tableView dequeueReusableCellWithIdentifier: @"activity1"];
    ActivityTableViewCell* cell02 = [self.tableView dequeueReusableCellWithIdentifier: @"activity2"];
    ActivityTableViewCell* cell03 = [self.tableView dequeueReusableCellWithIdentifier: @"activity3"];

    if (indexPath.section == 0) {
        return cell01;
    } else if (indexPath.section == 1) {
        return cell02;
    } else if (indexPath.section == 2) {
        return cell03;
    } else {
        return nil;
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

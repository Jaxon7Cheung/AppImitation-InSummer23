//
//  RecommandViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/29.
//

#import "RecommendViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "MainTableViewCell.h"

@interface RecommendViewController ()

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    UIBarButtonItem* btn1 = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"holidayfanhui.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressReturn)];
    UIBarButtonItem* btn2 = [[UIBarButtonItem alloc] initWithTitle: @"我推荐的" menu: nil];
    [self.navigationItem setLeftBarButtonItems: [NSArray arrayWithObjects: btn1, btn2, nil]];
    btn1.tintColor = [UIColor whiteColor];
    btn2.tintColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame: self.view.bounds];
    self.scrollView.contentSize = CGSizeMake(WIDTH, HEIGHT);
    self.scrollView.scrollEnabled = NO;
    self.scrollView.pagingEnabled = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.backgroundColor = [UIColor colorWithDisplayP3Red: 234.0 / 255 green: 234.0 / 255 blue: 234.0 / 255 alpha: 234.0 / 255];
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(WIDTH / 2 - 185, 0, 370, HEIGHT * 1.15 - 220) style: UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.scrollView addSubview: self.tableView];
    [self.view addSubview: self.scrollView];
    
    
    
    //[self.tableView registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"holiday"];
    [self.tableView registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"paint"];
    [self.tableView registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"design"];
    [self.tableView registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"order"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 145;
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
    //MainTableViewCell* cell01 = [self.tableView dequeueReusableCellWithIdentifier: @"holiday"];
    MainTableViewCell* cell02 = [self.tableView dequeueReusableCellWithIdentifier: @"paint"];
    MainTableViewCell* cell03 = [self.tableView dequeueReusableCellWithIdentifier: @"design"];
    MainTableViewCell* cell04 = [self.tableView dequeueReusableCellWithIdentifier: @"order"];

    if (indexPath.section == 0) {
        return cell02;
    } else if (indexPath.section == 1) {
        return cell03;
    } else if (indexPath.section == 2) {
        return cell04;
    } else {
        return nil;
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

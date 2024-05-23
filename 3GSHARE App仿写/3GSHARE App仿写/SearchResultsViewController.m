//
//  SearchResultsViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/29.
//

#import "SearchResultsViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "MainTableViewCell.h"
#import "UpImageViewController.h"

@interface SearchResultsViewController ()

@end

@implementation SearchResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"搜索";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize: 26];
    self.navigationItem.titleView = titleLabel;
    UIBarButtonItem* btn = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"holidayfanhui.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressReturn)];
    self.navigationItem.leftBarButtonItem = btn;
    btn.tintColor = [UIColor whiteColor];
    
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.text = @"DB";
    self.searchBar.barTintColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    self.searchBar.showsSearchResultsButton = YES;
    self.searchBar.searchResultsButtonSelected = YES;
    self.searchBar.frame = CGRectMake(0, 100, WIDTH, 55);
    [self.view addSubview: self.searchBar];
    
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(WIDTH / 2 - 185, 175, 370, 420) style: UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview: self.tableView];
    
    [self.tableView registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"results1"];
    [self.tableView registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"results2"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"shangchuantupian.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressUpImage)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
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
    //return [UIView new];
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
    MainTableViewCell* cell01 = [self.tableView dequeueReusableCellWithIdentifier: @"results1"];
    MainTableViewCell* cell02 = [self.tableView dequeueReusableCellWithIdentifier: @"results2"];
    
    if (indexPath.section == 0) {
        return cell01;
    } else if (indexPath.section == 1) {
        return cell02;
    } else {
        return nil;
    }
    
}

- (void)pressReturn {
    [self.navigationController popViewControllerAnimated: YES];
}

- (void)pressUpImage {
    UpImageViewController* upImageView = [[UpImageViewController alloc] init];
    [self.navigationController pushViewController: upImageView animated: YES];
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

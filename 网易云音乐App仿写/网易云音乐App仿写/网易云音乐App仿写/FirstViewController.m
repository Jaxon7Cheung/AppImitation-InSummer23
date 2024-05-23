//
//  FirstViewController.m
//  网易云音乐App仿写
//
//  Created by 张旭洋 on 2023/7/21.
//

#import "FirstViewController.h"
#import "SettingViewController.h"
#import "AdverisementTableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width 

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.leftBtn = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"caidan"] style: UIBarButtonItemStylePlain target: self action: @selector(pressMenu)];
    self.rightBtn = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"tinggeshiqu"] style: UIBarButtonItemStylePlain target: nil action: nil];
    self.navigationItem.leftBarButtonItem = self.leftBtn;
    self.navigationItem.rightBarButtonItem = self.rightBtn;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.placeholder = @"JacksonWang Papillon";
    self.searchBar.showsSearchResultsButton = YES;
    self.navigationItem.titleView = self.searchBar;
    
    self.tableView = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStylePlain] ;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview: self.tableView];
    
    [self.tableView registerClass: [AdverisementTableViewCell class] forCellReuseIdentifier: @"advertisement"];
    [self.tableView registerClass: [AdverisementTableViewCell class] forCellReuseIdentifier: @"items"];
    [self.tableView registerClass: [AdverisementTableViewCell class] forCellReuseIdentifier: @"recommend"];
    [self.tableView registerClass: [AdverisementTableViewCell class] forCellReuseIdentifier: @"deeptime"];
  

}

- (void)pressMenu
{
    SettingViewController* settingView = [[SettingViewController alloc] init];
    
    [self presentViewController: settingView animated: YES completion: nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //使虚拟键盘回收，不再作为第一消息响应者
    [self.searchBar resignFirstResponder];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return (WIDTH - 45) * 0.618 - 65;
    } else if (indexPath.section == 1) {
        return 64;
    } else if (indexPath.section == 2) {
        return 177;
    } else if (indexPath.section == 3) {
        return 299;
    } else {
        return 0;
    }
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (section == 2) return @"tou";
//    else return nil;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if (section == 2) return 20;
//    else return 0;
//}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView* view = [[UITableViewHeaderFooterView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
//    if (section == 2) return view;
//    else return 0;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AdverisementTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier: @"advertisement"];
    AdverisementTableViewCell* cell01 = [self.tableView dequeueReusableCellWithIdentifier: @"items"];
    AdverisementTableViewCell* cell02 = [self.tableView dequeueReusableCellWithIdentifier: @"recommend"];
    AdverisementTableViewCell* cell03 = [self.tableView dequeueReusableCellWithIdentifier: @"deeptime"];
    
    if (indexPath.section == 0) {
        return cell;
    } else if (indexPath.section == 1) {
        return cell01;
    } else if (indexPath.section == 2) {
        return cell02;
    } else if (indexPath.section == 3) {
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

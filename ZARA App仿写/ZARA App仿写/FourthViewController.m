//
//  FourthViewController.m
//  ZARA App仿写
//
//  Created by 张旭洋 on 2023/7/20.
//

#import "FourthViewController.h"
#import "ReloadPassViewController.h"


@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"🙎";
    
    UINavigationBarAppearance* appearance = [[UINavigationBarAppearance alloc] init];
    
    
    //设置导航栏标题文本属性
//    NSDictionary *titleTextAttributes = @{
//        NSFontAttributeName: [UIFont boldSystemFontOfSize: 19],
//        NSForegroundColorAttributeName: [UIColor whiteColor]
//    };
//    appearance.titleTextAttributes = titleTextAttributes;
    
    
    //self.view.backgroundColor = [UIColor blackColor];
    //设置导航栏背景颜色
    //UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = [UIColor darkGrayColor];
    //appearance.shadowImage = [UIImage new];
    //appearance.shadowColor = nil;
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    [[UINavigationBar appearance] setStandardAppearance: appearance];
    
    
    //self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    
    
    self.tableView = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview: self.tableView];
    
    //[self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier: @"Cell"];
    //[self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier: @"Cell01"];

    
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 0) {
        return 55;
    } else {
        return 155;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) return 0;
    else return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 3) {
        return 1;
    } else {
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"Cell";
    self.cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    
//    NSString* cell01Identifier = @"Cell01";
//    self.cell01 = [tableView dequeueReusableCellWithIdentifier: cell01Identifier];
    
    if (self.cell == nil) {
        self.cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier: cellIdentifier];
    }
    
//    if (self.cell01 == nil) {
//        self.cell01 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier: cell01Identifier];
//    }
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        self.cell.textLabel.text = @":)";
        self.cell.detailTextLabel.text = @"Account：Zxvy20030419";
        //self.cell.detailTextLabel.font = [UIFont systemFontOfSize: 9];
        self.cell.detailTextLabel.textColor = [UIColor darkGrayColor];
        
        NSString* str = [NSString stringWithFormat: @"touxiang.jpg"];
        UIImage* image = [UIImage imageNamed: str];
        
        //设置圆角
        self.cell.imageView.image = image;
        self.cell.imageView.layer.cornerRadius = 9;
        self.cell.imageView.layer.masksToBounds = YES;
        
    } else if (indexPath.row == 0 && indexPath.section == 1) {
        self.cell.textLabel.text = @"服务";
        NSString* str = [NSString stringWithFormat: @"weixinzhifu.png"];
        UIImage* image = [UIImage imageNamed: str];
        self.cell.imageView.image = image;
    } else if (indexPath.row == 0 && indexPath.section == 2) {
        self.cell.textLabel.text = @"收藏";
        NSString* str = [NSString stringWithFormat: @"wechatEnshrine.png"];
        UIImage* image = [UIImage imageNamed: str];
        self.cell.imageView.image = image;
    } else if (indexPath.row == 1 && indexPath.section == 2) {
        self.cell.textLabel.text = @"朋友圈";
        self.cell.detailTextLabel.text = @"+8613999999999";
        NSString* str = [NSString stringWithFormat: @"wodepengyouquan.png"];
        UIImage* image = [UIImage imageNamed: str];
        self.cell.imageView.image = image;
    } else if (indexPath.row == 2 && indexPath.section == 2) {
        self.cell.textLabel.text = @"视频号";
        NSString* str = [NSString stringWithFormat: @"shipinhao.png"];
        UIImage* image = [UIImage imageNamed: str];
        self.cell.imageView.image = image;
        self.cell.detailTextLabel.text = @"..........";
    } else if (indexPath.row == 3 && indexPath.section == 2) {
        self.cell.textLabel.text = @"卡包";
        NSString* str = [NSString stringWithFormat: @"kabao.png"];
        UIImage* image = [UIImage imageNamed: str];
        self.cell.imageView.image = image;
    } else if (indexPath.row == 4 && indexPath.section == 2) {
        self.cell.textLabel.text = @"表情";
        NSString* str = [NSString stringWithFormat: @"weixinbiaoqing-copy.png"];
        UIImage* image = [UIImage imageNamed: str];
        self.cell.imageView.image = image;
    } else if (indexPath.row == 0 && indexPath.section == 3) {
        self.cell.textLabel.text = @"设置";
        NSString* str = [NSString stringWithFormat: @"shezhi.png"];
        UIImage* image = [UIImage imageNamed: str];
        self.cell.imageView.image = image;
    }
    
    self.cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return self.cell;
}




#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    if (indexPath.section ==2 && indexPath.row == 4) {
        ReloadPassViewController* reloadPassView = [[ReloadPassViewController alloc] init];
        [self.navigationController pushViewController: reloadPassView animated: YES];
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

//
//  NewSubscribeViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/30.
//

#import "NewSubscribeViewController.h"
#import "NewSubscribeTableViewCell.h"

@interface NewSubscribeViewController ()

@end

@implementation NewSubscribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    UIBarButtonItem* btn1 = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"holidayfanhui.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressReturn)];
    UIBarButtonItem* btn2 = [[UIBarButtonItem alloc] initWithTitle: @"新关注的" menu: nil];
    [self.navigationItem setLeftBarButtonItems: [NSArray arrayWithObjects: btn1, btn2, nil]];
    btn1.tintColor = [UIColor whiteColor];
    btn2.tintColor = [UIColor whiteColor];
    
    
    self.subscribeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style: UITableViewStylePlain];
    [self.view addSubview: self.subscribeTableView];
    self.subscribeTableView.delegate = self;
    self.subscribeTableView.dataSource = self;
    
    [self.subscribeTableView registerClass: [NewSubscribeTableViewCell class] forCellReuseIdentifier: @"subscribe"];
    
    self.nameArray = [NSArray arrayWithObjects:@"share 小格", @"share 小兰", @"share 小明", @"share 小雪", @"share 萌萌", @"share tLity", nil];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewSubscribeTableViewCell* cell = [self.subscribeTableView dequeueReusableCellWithIdentifier: @"subscribe" forIndexPath: indexPath];
    [cell.elseHeadPhotoImageView setImage:[UIImage imageNamed: [NSString stringWithFormat: @"sixin_img%lu.png", indexPath.row + 1]]];
    cell.elseNameLabel.text = self.nameArray[indexPath.row];
    
    return cell;
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

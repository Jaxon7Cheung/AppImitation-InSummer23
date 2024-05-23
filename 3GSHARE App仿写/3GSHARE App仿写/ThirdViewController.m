//
//  ThirdViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/26.
//

#import "ThirdViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "MainTableViewCell.h"


@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.segmented = [[UISegmentedControl alloc] initWithItems: @[@"精选文章", @"热门推荐", @"全部文章"]];
    self.segmented.frame = CGRectMake(0, 98, WIDTH, 50);
    self.segmented.selectedSegmentIndex = 0;
    [self.segmented addTarget: self action: @selector(segmentedControlValueChanged:) forControlEvents: UIControlEventValueChanged];
    [self.view addSubview: self.segmented];
    //segmented.tintColor = [UIColor blueColor];
    
    self.scrollView.backgroundColor = [UIColor systemMintColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 150, WIDTH, HEIGHT)];
    self.scrollView.contentSize = CGSizeMake(WIDTH * 3, HEIGHT);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    //self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self.view addSubview: self.scrollView];
    
    self.tableView01 = [[UITableView alloc]  initWithFrame: CGRectMake(12 + WIDTH * 0, 0, 370, HEIGHT * 1.15 - 220) style: UITableViewStylePlain];
    self.tableView01.delegate = self;
    self.tableView01.dataSource = self;
    self.tableView01.backgroundColor = [UIColor clearColor];
    self.tableView01.showsVerticalScrollIndicator = NO;
    self.tableView02 = [[UITableView alloc]  initWithFrame: CGRectMake(12 + WIDTH * 1, 0, 370, HEIGHT * 1.15 - 220) style: UITableViewStylePlain];
    self.tableView02.delegate = self;
    self.tableView02.dataSource = self;
    self.tableView02.backgroundColor = [UIColor clearColor];
    self.tableView02.showsVerticalScrollIndicator = NO;
    self.tableView03 = [[UITableView alloc]  initWithFrame:  CGRectMake(12 + WIDTH * 2, 0, 370, HEIGHT * 1.15 - 220) style: UITableViewStylePlain];
    self.tableView03.delegate = self;
    self.tableView03.dataSource = self;
    self.tableView03.showsVerticalScrollIndicator = NO;
    self.tableView03.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview: self.tableView01];
    [self.scrollView addSubview: self.tableView02];
    [self.scrollView addSubview: self.tableView03];
    
    [self.tableView01 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan1"];
    [self.tableView01 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan2"];
    [self.tableView01 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan3"];
    [self.tableView01 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan4"];
    [self.tableView01 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan5"];
    [self.tableView02 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan1"];
    [self.tableView02 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan2"];
    [self.tableView02 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan3"];
    [self.tableView02 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan4"];
    [self.tableView02 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan5"];
    [self.tableView03 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan1"];
    [self.tableView03 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan2"];
    [self.tableView03 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan3"];
    [self.tableView03 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan4"];
    [self.tableView03 registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"jingxvan5"];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 145;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UITableViewHeaderFooterView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* view = [[UITableViewHeaderFooterView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell* cell01 = [tableView dequeueReusableCellWithIdentifier: @"jingxvan1"];
    MainTableViewCell* cell02 = [tableView dequeueReusableCellWithIdentifier: @"jingxvan2"];
    MainTableViewCell* cell03 = [tableView dequeueReusableCellWithIdentifier: @"jingxvan3"];
    MainTableViewCell* cell04 = [tableView dequeueReusableCellWithIdentifier: @"jingxvan4"];
    MainTableViewCell* cell05 = [tableView dequeueReusableCellWithIdentifier: @"jingxvan5"];

    if (indexPath.section == 0) {
        return cell01;
    } else if (indexPath.section == 1) {
        return cell02;
    } else if (indexPath.section == 2) {
        return cell03;
    } else if (indexPath.section == 3) {
        return cell04;
    } else if (indexPath.section == 4) {
        return cell05;
    } else {
        return nil;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    NSInteger selectedIndex = (double)(contentOffsetX / scrollView.frame.size.width + 0.5);

    //UISegmentedControl *segmentedControl = (UISegmentedControl *)self.navigationItem.titleView;

    if (selectedIndex != self.segmented.selectedSegmentIndex) {
        self.segmented.selectedSegmentIndex = selectedIndex;
    }
}

- (void)segmentedControlValueChanged:(UISegmentedControl *)segmentedControl {
    NSInteger selectedIndex = segmentedControl.selectedSegmentIndex;
    UIScrollView *scrollView = self.scrollView;

    CGFloat offsetX = selectedIndex * scrollView.bounds.size.width;
    CGFloat offsetY = scrollView.contentOffset.y;
    [scrollView setContentOffset:CGPointMake(offsetX, offsetY) animated:YES];
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

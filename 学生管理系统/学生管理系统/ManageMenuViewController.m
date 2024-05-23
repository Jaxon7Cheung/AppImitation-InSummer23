//
//  ManageMenuViewController.m
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import "ManageMenuViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "StudentTableViewCell.h"


@interface ManageMenuViewController ()

@end

@implementation ManageMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor magentaColor];
    
    self.iView = [[UIImageView alloc] initWithImage: [[UIImage imageNamed:  @"backgroundd.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]];
    self.iView.userInteractionEnabled = YES;
    [self.view addSubview: self.iView];
    
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, WIDTH, HEIGHT * 0.60) style: UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.iView addSubview: self.tableView];
    [self.tableView registerClass: [StudentTableViewCell class] forCellReuseIdentifier: @"cellID"];
    self.tableView.layer.cornerRadius = 60.0;
    self.tableView.layer.masksToBounds = YES;
    self.tableView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.tableView.layer.borderWidth = 3.0;
    self.tableView.separatorColor = [UIColor whiteColor];
    
    self.arrayName = [[NSMutableArray alloc] init];
    self.arrayClass = [[NSMutableArray alloc] init];
    self.arrayNumber = [[NSMutableArray alloc] init];
    self.arrayName[0] = @"姓名";
    self.arrayClass[0] = @"班级";
    self.arrayNumber[0] = @"学号";
    self.arrayName[0] = @"李育腾";
    self.arrayClass[0] = @"智能2204";
    self.arrayNumber[0] = @"04001";
//    [self.arrayName addObjectsFromArray: [[NSMutableArray alloc] initWithObjects: @"冰墩墩", @"翟旭博", @"张旭洋", @"雪容融", @"嘎嘎", @"咕咕", nil] ];
//    [self.arrayClass addObjectsFromArray: [[NSMutableArray alloc] initWithObjects: @"智能2203", @"智能2204", @"智能2203", @"智能2201", @"智能2202", @"智能2201", nil] ];
//    [self.arrayName addObjectsFromArray: [[NSMutableArray alloc] initWithObjects: @"03077", @"04002", @"03077", @"01001", @"02076", @"01002", nil] ];
//    [self.arrayName addObjectsFromArray: [[NSMutableArray alloc] initWithObjects: @"李育腾", @"翟旭博", @"张旭洋", @"雪容融", @"嘎嘎", @"咕咕", nil] ];
//    [self.arrayClass addObjectsFromArray: [[NSMutableArray alloc] initWithObjects: @"智能2204", @"智能2204", @"智能2203", @"智能2201", @"智能2202", @"智能2201", nil] ];
//    [self.arrayName addObjectsFromArray: [[NSMutableArray alloc] initWithObjects: @"04001", @"04002", @"03077", @"01001", @"02076", @"01002", nil] ];
 
    self.addButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.addButton.frame = CGRectMake(WIDTH / 2 - 130, 550, 100, 40);
    [self.addButton setTitle: @"Add" forState: UIControlStateNormal];
    [self.addButton setTintColor: [UIColor whiteColor]];
    self.addButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18];
    [self.addButton setBackgroundColor: [UIColor clearColor]];
    [self.addButton.layer setMasksToBounds: YES];
    [self.addButton.layer setCornerRadius: 9.0];
    [self.addButton.layer setBorderWidth: 3.0];
    self.addButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.iView addSubview: self.addButton];
    [self.addButton addTarget: self action: @selector(pressAdd) forControlEvents: UIControlEventTouchUpInside];
    
    self.deleteButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.deleteButton.frame = CGRectMake(WIDTH - 170, 550, 100, 40);
    [self.deleteButton setTitle: @"Delete" forState: UIControlStateNormal];
    [self.deleteButton setTintColor: [UIColor whiteColor]];
    self.deleteButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18];
    [self.deleteButton setBackgroundColor: [UIColor clearColor]];
    [self.deleteButton.layer setMasksToBounds: YES];
    [self.deleteButton.layer setCornerRadius: 9.0];
    [self.deleteButton.layer setBorderWidth: 3.0];
    self.deleteButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.iView addSubview: self.deleteButton];
    [self.deleteButton addTarget: self action: @selector(pressDelete) forControlEvents: UIControlEventTouchUpInside];
    
    self.modifyButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.modifyButton.frame = CGRectMake(WIDTH / 2 - 120, 610, 230, 40);
    [self.modifyButton setTitle: @"ModifyOrSearch" forState: UIControlStateNormal];
    [self.modifyButton setTintColor: [UIColor whiteColor]];
    self.modifyButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18];
    [self.modifyButton setBackgroundColor: [UIColor clearColor]];
    [self.modifyButton.layer setMasksToBounds: YES];
    [self.modifyButton.layer setCornerRadius: 9.0];
    [self.modifyButton.layer setBorderWidth: 3.0];
    self.modifyButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.iView addSubview: self.modifyButton];
    [self.modifyButton addTarget: self action: @selector(pressModify) forControlEvents: UIControlEventTouchUpInside];
    
//    self.searchButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
//    self.searchButton.frame = CGRectMake(WIDTH - 170, 610, 100, 40);
//    [self.searchButton setTitle: @"Search" forState: UIControlStateNormal];
//    [self.searchButton setTintColor: [UIColor whiteColor]];
//    self.searchButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18];
//    [self.searchButton setBackgroundColor: [UIColor clearColor]];
//    [self.searchButton.layer setMasksToBounds: YES];
//    [self.searchButton.layer setCornerRadius: 9.0];
//    [self.searchButton.layer setBorderWidth: 3.0];
//    self.searchButton.layer.borderColor = [UIColor whiteColor].CGColor;
//    [self.iView addSubview: self.searchButton];
//    [self.searchButton addTarget: self action: @selector(pressSearch) forControlEvents: UIControlEventTouchUpInside];
    
    self.sortButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.sortButton.frame = CGRectMake(WIDTH / 2 - 120, 670, 230, 40);
    [self.sortButton setTitle: @"Sort" forState: UIControlStateNormal];
    [self.sortButton setTintColor: [UIColor whiteColor]];
    self.sortButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18];
    [self.sortButton setBackgroundColor: [UIColor clearColor]];
    [self.sortButton.layer setMasksToBounds: YES];
    [self.sortButton.layer setCornerRadius: 9.0];
    [self.sortButton.layer setBorderWidth: 3.0];
    self.sortButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.iView addSubview: self.sortButton];
    [self.sortButton addTarget: self action: @selector(pressSort) forControlEvents: UIControlEventTouchUpInside];
    
    self.exitButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.exitButton.frame = CGRectMake(WIDTH / 2 - 120, 730, 230, 40);
    [self.exitButton setTitle: @"Exit" forState: UIControlStateNormal];
    [self.exitButton setTintColor: [UIColor redColor]];
    self.exitButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18];
    [self.exitButton setBackgroundColor: [UIColor clearColor]];
    [self.exitButton.layer setMasksToBounds: YES];
    [self.exitButton.layer setCornerRadius: 9.0];
    [self.exitButton.layer setBorderWidth: 3.0];
    self.exitButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.iView addSubview: self.exitButton];
    [self.exitButton addTarget: self action: @selector(pressExit) forControlEvents: UIControlEventTouchUpInside];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayName.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StudentTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier: @"cellID"];
    
    cell.nameLabel.text = self.arrayName[indexPath.row];
    cell.classLabel.text = self.arrayClass[indexPath.row];
    cell.numberLabel.text = self.arrayNumber[indexPath.row];
    
    return cell;
}

- (void)pressAdd {
    if (!self.addViewController) self.addViewController = [[AddViewController alloc] init];
    self.addViewController.delegate = self;
    self.addViewController.arrayName = self.arrayName;
    self.addViewController.arrayClass = self.arrayClass;
    self.addViewController.arrayNumber = self.arrayNumber;
    [self presentViewController: self.addViewController animated: YES completion: nil];
}

- (void)pushName:(NSMutableArray *)arrayName andClass:(NSMutableArray *)arrayClass andNumber:(NSMutableArray *)arrayNumber {
    self.arrayName = arrayName;
    self.arrayClass = arrayClass;
    self.arrayNumber = arrayNumber;
    [self.tableView reloadData];
}

- (void)pressDelete {
    if (!self.deleteViewController) self.deleteViewController = [[DeleteViewController alloc] init];
    self.deleteViewController.delegate = self;
    self.deleteViewController.arrayName = self.arrayName;
    self.deleteViewController.arrayClass = self.arrayClass;
    self.deleteViewController.arrayNumber = self.arrayNumber;
    [self presentViewController: self.deleteViewController animated: YES completion: nil];
}

- (void)pushDeleteName:(NSMutableArray *)arrayName andClass:(NSMutableArray *)arrayClass andNumber:(NSMutableArray *)arrayNumber {
    self.arrayName = arrayName;
    self.arrayClass = arrayClass;
    self.arrayNumber = arrayNumber;
    [self.tableView reloadData];
}

- (void)pressModify {
    if (!self.modifyViewController) self.modifyViewController = [[ModifyViewController alloc] init];
    self.modifyViewController.delegate = self;
    self.modifyViewController.arrayName = self.arrayName;
    self.modifyViewController.arrayClass = self.arrayClass;
    self.modifyViewController.arrayNumber = self.arrayNumber;
    [self presentViewController: self.modifyViewController animated: YES completion: nil];
}

- (void)pushModifyName:(NSMutableArray *)arrayName andClass:(NSMutableArray *)arrayClass andNumber:(NSMutableArray *)arrayNumber {
    self.arrayName = arrayName;
    self.arrayClass = arrayClass;
    self.arrayNumber = arrayNumber;
    [self.tableView reloadData];
}

//- (void)pressSearch {
//
//}

- (void)pressSort {
    [self bubbleSort];
    [self.tableView reloadData];
}

- (void)bubbleSort {
    for (int i = 0; i < self.arrayNumber.count - 1; ++i) {
        for (int j = 1; j < self.arrayNumber.count - i - 1; ++j) {
            if ([self.arrayNumber[j] intValue] > [self.arrayNumber[j + 1] intValue]) {
                NSMutableString* tmp = [[NSMutableString alloc] init];
                tmp = self.arrayNumber[j];
                self.arrayNumber[j] = self.arrayNumber[j + 1];
                self.arrayNumber[j + 1] = tmp;
                
                tmp = self.arrayName[j];
                self.arrayName[j] = self.arrayName[j + 1];
                self.arrayName[j + 1] = tmp;
                
                tmp = self.arrayNumber[j];
                self.arrayClass[j] = self.arrayClass[j + 1];
                self.arrayClass[j + 1] = tmp;
            }
        }
    }
}

- (void)pressExit {
    
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

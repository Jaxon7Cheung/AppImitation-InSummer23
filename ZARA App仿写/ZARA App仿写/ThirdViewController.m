//
//  ThirdViewController.m
//  ZARA App仿写
//
//  Created by 张旭洋 on 2023/7/20.
//

#import "ThirdViewController.h"
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.segmented = [[UISegmentedControl alloc] initWithItems: @[@"wanted", @"special wanted", @"super wanted"]];
    self.segmented.frame = CGRectMake(30, 77, 333, 50);
    self.segmented.selectedSegmentIndex = 1;
    [self.segmented addTarget: self action: @selector(segmentedControlValueChanged:) forControlEvents: UIControlEventValueChanged];
    [self.view addSubview: self.segmented];
    //segmented.tintColor = [UIColor blueColor];

    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(25, 177, (HEIGHT - 300) * 0.618, HEIGHT - 300);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake((HEIGHT - 300) * 0.618 * 3, HEIGHT - 300);
    [self.view addSubview:self.scrollView];
    for (int i = 0; i < 3; ++i) {
        NSString* strName = [NSString stringWithFormat: @"m%d.jpg", i + 1];
        UIImage* image = [UIImage imageNamed: strName];
        
        UIImageView* iView = [[UIImageView alloc] initWithImage: image];
        iView.frame = CGRectMake((HEIGHT - 300) * 0.618 * i, 0, (HEIGHT - 300) * 0.618, (HEIGHT - 300));
        [self.scrollView addSubview: iView];
    }
    self.scrollView.delegate = self;
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

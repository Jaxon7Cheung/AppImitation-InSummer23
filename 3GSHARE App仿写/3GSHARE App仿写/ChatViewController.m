//
//  ChatViewController.m
//  3GSHARE App仿写
//
//  Created by 张旭洋 on 2023/7/31.
//

#import "ChatViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height


@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];

    
    self.textField = [[UITextField alloc] initWithFrame: CGRectMake(WIDTH * 0.07, HEIGHT * 0.90, WIDTH * 0.75, HEIGHT * 0.06)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.layer.borderColor = [UIColor blackColor].CGColor;
    self.textField.delegate = self;
    self.sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sendButton.backgroundColor = [UIColor colorWithRed: 0.27 green: 0.55 blue: 0.8 alpha: 1.0];
    [self.sendButton setTitle:@"发送" forState: UIControlStateNormal];
    [self.sendButton setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
    [self.sendButton addTarget: self action: @selector(send) forControlEvents: UIControlEventTouchUpInside];
    self.sendButton.frame = CGRectMake(WIDTH * 0.83, HEIGHT * 0.90, WIDTH * 0.15, HEIGHT * 0.06);
    self.sendButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.sendButton.layer.borderWidth = 1;
    self.sendButton.layer.cornerRadius = 10;
    self.returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.returnButton setImage: [UIImage imageNamed: @"holidayfanhui.png"] forState: UIControlStateNormal];
    [self.returnButton setTintColor: [UIColor colorWithRed: 0.27 green: 0.55 blue: 0.8 alpha: 1.0]];
    [self.returnButton addTarget: self action: @selector(pressReturn) forControlEvents: UIControlEventTouchUpInside];
    self.returnButton.frame = CGRectMake(WIDTH * -0.04, HEIGHT * 0.90, WIDTH * 0.15, HEIGHT * 0.06);
    self.returnButton.layer.cornerRadius = 10;
    
    [self.view addSubview: self.returnButton];
    [self.view addSubview: self.textField];
    [self.view addSubview: self.sendButton];
    
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, WIDTH, HEIGHT - 88) style: UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //设置分割线(设置为无样式)
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview: self.tableView];
        
    //设置聊天信息数值
    self.messageArray = [NSMutableArray arrayWithObjects:@"在的，亲～", @"明天可以发货吗么", @"不可以", @"那什么时候可以发", @"可以发顺丰么", @"不接受指定快递哦宝", @"好吧，那你们发什么快递", @"顺丰", @"你是真贱", nil];
    self.rowHeightArray = [[NSMutableArray alloc] init];
    for (NSString *str in self.messageArray) {
        //因为boundingRectWithSize: options: attributes: context: 函数中参数三需要使用字典数组
        //P1:文本显示的最大宽度和最大高度
        //P2:计算的类型 NSStringDrawingUsesLineFragmentOrigin 绘制文本时使用，一般使用这项
        //P3:文本属性
        //P4:包括一些信息，例如如何调整字间距以及缩放。该参数一般可为 nil
        NSDictionary* attri = @{NSFontAttributeName: [UIFont systemFontOfSize: 18]};
        //计算每个字符串所需的高度
        CGSize size = [str boundingRectWithSize: CGSizeMake(WIDTH * 0.6, HEIGHT * 0.41) options: NSStringDrawingUsesLineFragmentOrigin attributes: attri context: nil].size;
        //聊天框高度，+ W * 0.15为了保持会话之间的距离
        int height = size.height + WIDTH * 0.15;
        self.rowHeight = [NSNumber numberWithInt: height];
        //存储在数组里，设置行高时使用
        [self.rowHeightArray addObject: self.rowHeight];
    }
}

- (void)send {
    [self.messageArray addObject: self.textField.text];
    NSDictionary* attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    //自适应高度，并计算
    CGSize size = [self.textField.text boundingRectWithSize:CGSizeMake(WIDTH * 0.6, HEIGHT * 0.58) options: NSStringDrawingUsesLineFragmentOrigin attributes: attri context: nil].size;
    int height = size.height + WIDTH * 0.15;
    self.rowHeight = [NSNumber numberWithInt: height];
    [self.rowHeightArray addObject: self.rowHeight];
    
    //加入一个cell
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow: self.messageArray.count - 1 inSection: 0];
    [self.tableView insertRowsAtIndexPaths: @[indexPath] withRowAnimation: UITableViewRowAnimationBottom];
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath: indexPath atScrollPosition: UITableViewScrollPositionBottom animated: YES];
    
    //清空textField
    self.textField.text = @"";
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* cellId = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: cellId];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    } else {
        //tableView的复用，如果不删除，会出现bug
        //删除cell所有的子视图
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    //分割线风格（无显示）
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //一人一句话
    if(indexPath.row % 2 != 0){
        //设置头像
        UIImageView* imageView = [[UIImageView alloc]initWithImage: [UIImage imageNamed: @"headShot.png"]];
        imageView.frame = CGRectMake(WIDTH * 0.01, WIDTH * 0.05, WIDTH * 0.1, WIDTH * 0.1);
        imageView.layer.cornerRadius = 9.0;
        imageView.layer.masksToBounds = YES;
        [cell.contentView addSubview: imageView];
        
        //设置对话框
        UILabel* label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.text = self.messageArray[indexPath.row];
        label.font = [UIFont systemFontOfSize: 18];
        NSDictionary* attri = @{NSFontAttributeName: label.font};
        //自适应高度
        CGSize size = [label.text boundingRectWithSize: CGSizeMake(WIDTH * 0.6, HEIGHT * 0.58) options: NSStringDrawingUsesLineFragmentOrigin attributes: attri context:nil].size;
        label.frame = CGRectMake(WIDTH * 0.13, WIDTH * 0.07, size.width, size.height + WIDTH * 0.05);
        
        //设置聊天气泡
        UIImageView* imageViewBubble = [[UIImageView alloc] init];
        imageViewBubble.backgroundColor = [UIColor colorWithRed: 35.0 / 255 green: 101.0 / 255 blue: 177.0 / 255 alpha: 1.0];
        imageViewBubble.frame = CGRectMake(WIDTH * 0.12, WIDTH * 0.07, size.width + WIDTH * 0.05, size.height + WIDTH * 0.03);
        imageViewBubble.layer.cornerRadius = 9.0;
        imageViewBubble.layer.masksToBounds = YES;
        
        [cell.contentView addSubview: imageViewBubble];
        [cell.contentView addSubview: label];
        
    } else {
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list_img1.png"]];
        imageView.frame = CGRectMake(WIDTH * 0.89, WIDTH * 0.01, WIDTH * 0.1, WIDTH * 0.1);
        imageView.layer.cornerRadius = 9.0;
        imageView.layer.masksToBounds = YES;
        [cell.contentView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.text = self.messageArray[indexPath.row];
        label.font = [UIFont systemFontOfSize:18];
        NSDictionary* attri = @{NSFontAttributeName:label.font};
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(WIDTH * 0.6, HEIGHT * 0.58) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        label.frame = CGRectMake(WIDTH * 0.86 - size.width, WIDTH * 0.05, size.width, size.height);
        
        UIImageView *imageViewBubble = [[UIImageView alloc] init];
        imageViewBubble.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1.0];
        imageViewBubble.frame = CGRectMake(WIDTH * 0.82 - size.width, WIDTH * 0.03, size.width + WIDTH * 0.05, size.height + WIDTH * 0.03);
        imageViewBubble.layer.cornerRadius = 9.0;
        imageViewBubble.layer.masksToBounds = YES;
        
        [cell.contentView addSubview:imageViewBubble];
        [cell.contentView addSubview:label];
        
    }
    
    return cell;
    
}

//设置单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //将NSNumber型的height转换为CGFloat型
    CGFloat height = [self.rowHeightArray[indexPath.row] floatValue];
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageArray.count;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //使虚拟键盘回收，不再作为第一消息响应者
    [self.textField resignFirstResponder];
}

- (void)pressReturn {
    [self dismissViewControllerAnimated: YES completion: nil];
}

- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration: 1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration: 1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height + 19);}];
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

//
//  ChatViewController.h
//  3GSHARE App仿写
//
//  Created by 张旭洋 on 2023/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property UITextField* textField;
@property UIButton* sendButton;
@property UITableView* tableView;
@property NSMutableArray* messageArray;
@property (nonatomic) NSNumber* rowHeight;
@property NSMutableArray* rowHeightArray;
@property (nonatomic, strong)UIButton* returnButton;

@end

NS_ASSUME_NONNULL_END

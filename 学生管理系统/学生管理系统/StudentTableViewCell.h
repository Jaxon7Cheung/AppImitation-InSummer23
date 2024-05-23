//
//  StudentTableViewCell.h
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StudentTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel* nameLabel;
@property (nonatomic, strong)UILabel* classLabel;
@property (nonatomic, strong)UILabel* numberLabel;


@end

NS_ASSUME_NONNULL_END

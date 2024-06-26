//
//  NSMutableArray+ErrorHandle.h
//  天气预报App仿写
//
//  Created by . on 2023/8/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (ErrorHandle)

/**
 数组中插入数据

 @param object 数据
 @param index 下标
 */
- (void)insertObjectVerify:(id)object atIndex:(NSInteger)index;
/**
 数组中添加数据

 @param object 数据
 */
- (void)addObjectVerify:(id)object;

@end

NS_ASSUME_NONNULL_END

//
//  NSMutableArray+ErrorHandle.m
//  天气预报App仿写
//
//  Created by . on 2023/8/3.
//

#import "NSMutableArray+ErrorHandle.h"

@implementation NSMutableArray (ErrorHandle)

/**
 *  数组中插入数据
 */
- (void)insertObjectVerify:(id)object atIndex:(NSInteger)index{
    if (index < self.count && object) {
        [self insertObject:object atIndex:index];
    }
}
/**
 *  数组中添加数据
 */
- (void)addObjectVerify:(id)object{
    if (object) {
        [self addObject:object];
    }
}

@end

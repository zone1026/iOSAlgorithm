//
//  YZInsertionSort.m
//  iOSAlgorithm
//
//  Created by 黄亚州 on 2021/8/21.
//

#import "YZInsertionSort.h"

@implementation YZInsertionSort

#pragma mark - Public Method

- (NSString *)insertionSort {
    // 记录开始时间
    [self recordAlgorithmStartTimestamp];
    
    NSMutableArray <NSNumber *> *arrM = [self fetchOriginalValueArray];
    for (NSInteger i = 1; i < arrM.count; i++) {
        NSInteger j = i;
        while (j > 0 && arrM[j].integerValue < arrM[j - 1].integerValue) {
            [self swapped:arrM withFormIndex:j withToIndex:(j - 1)];
            j --;
        }
    }
    
    // 输出执行消耗时间
    [self logAlgorithmConsumeTime:[NSString stringWithFormat:@"%s", __func__]];
    
    return [NSString stringWithFormat:@"array sort result: %@", [arrM componentsJoinedByString:@","]];
}

- (NSString *)binaryInsertionSort {
    // 记录开始时间
    [self recordAlgorithmStartTimestamp];
    
    NSMutableArray <NSNumber *> *arrM = [self fetchOriginalValueArray];
    for (NSInteger i = 1; i < arrM.count; i++) {
        NSInteger temp = [[arrM objectAtIndex:i] integerValue];
        // 当前索引前已做好的排序索引
        NSInteger left = 0;
        NSInteger right = i - 1;
        // 对已排序的元素折半比较，找到合适的插入位置
        while (left <= right) {
            NSInteger middle = (left + right) / 2;
            if (temp < [[arrM objectAtIndex:middle] integerValue]) {
                right = middle - 1;
            } else {
                left = middle + 1;
            }
        }
        
        // 位移交换当前索引i和插入位置之间的元素
        for (NSInteger j = i; j > left; j --) {
            [arrM replaceObjectAtIndex:j withObject:[arrM objectAtIndex:(j - 1)]];
        }
        
        // 当前索引i元素插入到指定位置
        [arrM replaceObjectAtIndex:left withObject:[NSNumber numberWithInteger:temp]];
    }
    
    // 输出执行消耗时间
    [self logAlgorithmConsumeTime:[NSString stringWithFormat:@"%s", __func__]];
    
    return [NSString stringWithFormat:@"array sort result: %@", [arrM componentsJoinedByString:@","]];
}

@end

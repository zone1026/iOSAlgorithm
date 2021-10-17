//
//  YZSortExample.m
//  iOSAlgorithm
//
//  Created by hyz on 2021/8/23.
//

#import "YZSortExample.h"

#import "YZBubbleSort.h"
#import "YZInsertionSort.h"
#import "YZQuickSort.h"

@implementation YZSortExample

#pragma mark - Init

#pragma mark - Public Methods

- (void)startSortExample {
    // 冒泡排序
    [self bubbleSortExample:NO];
    
    // 插入排序
    [self insertionSortExample:NO];
    
    // 快速排序
    [self quickSortExample:YES];
}

#pragma mark - Private Methods

/// 随机一组数字
/// @param maxValue 随机数的最大值
/// @param count 集合的元素个数
/// @return 数据集合
- (NSMutableArray *)randomNumberAddArray:(uint32_t)maxValue withCount:(NSUInteger)count {
    if (maxValue < 1 || count < 1) {
        return [NSMutableArray array];
    }
    
    NSMutableArray <NSNumber *> *arrM = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        NSNumber *value = [NSNumber numberWithInteger:arc4random_uniform(maxValue)];
        [arrM addObject:value];
    }
    
    return arrM;
}

#pragma mark - 冒泡排序

- (void)bubbleSortExample:(BOOL)showLog {
    YZBubbleSort *sort = [[YZBubbleSort alloc] initWithValueArray:[self randomNumberAddArray:65000 withCount:5600]];
    
    NSString *relustStr = [sort terribleSort];
    if (showLog == YES) {
        NSLog(@"%@", relustStr);
    }

    relustStr = [sort optimizeSort];
    if (showLog == YES) {
        NSLog(@"%@", relustStr);
    }
    
    relustStr = [sort cocktailSort];
    if (showLog == YES) {
        NSLog(@"%@", relustStr);
    }
}

#pragma mark - 插入排序

- (void)insertionSortExample:(BOOL)showLog {
    YZInsertionSort *insertionSort = [[YZInsertionSort alloc] initWithValueArray:[self randomNumberAddArray:65000 withCount:5600]];
    
    NSString *relustStr = [insertionSort insertionSort];
    if (showLog == YES) {
        NSLog(@"%@", relustStr);
    }
    
    relustStr = [insertionSort binaryInsertionSort];
    if (showLog == YES) {
        NSLog(@"%@", relustStr);
    }
}

#pragma mark - 快速排序

- (void)quickSortExample:(BOOL)showLog {
    YZQuickSort *quickSort = [[YZQuickSort alloc] initWithValueArray:[self randomNumberAddArray:65000 withCount:5600]];
    
    NSString *relustStr = [quickSort quickSort];
    if (showLog == YES) {
        NSLog(@"%@", relustStr);
    }
}

@end

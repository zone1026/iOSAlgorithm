//
//  YZBubbleSort.m
//  iOSAlgorithm
//
//  Created by hyz on 2021/8/23.
//

#import "YZBubbleSort.h"

@implementation YZBubbleSort

#pragma mark - Init

#pragma mark - Public Methods

/// 最复杂的一种
- (NSString *)terribleSort {
    // 记录开始时间
    [self recordAlgorithmStartTimestamp];
    
    NSMutableArray <NSNumber *> *arrM = [self fetchOriginalValueArray];
    NSInteger count = arrM.count;
    // 若最小元素在序列末尾，需要 n-1 次交换，才能交换到序列开头
    for (NSInteger i = 0; i < (count -1); i++) {
        for (NSInteger j = 0; j < (count -1); j++) {
            // 若这里的条件是 >=，则变成不稳定排序
            if (arrM[j].integerValue > arrM[j + 1].integerValue) {
                [self swapped:arrM withFormIndex:j withToIndex:(j + 1)];
            }
        }
    }
    
    // 输出执行消耗时间
    [self logAlgorithmConsumeTime:[NSString stringWithFormat:@"%s", __func__]];
    
    return [NSString stringWithFormat:@"sort result: %@", [arrM componentsJoinedByString:@","]];
}

/// 进一步优化：在每轮循环之后，可以确认，最后一次发生交换的位置之后的元素，都是已经排好序的，因此可以不再比较那个位置之后的元素，大幅度减少了比较的次数：
- (NSString *)optimizeSort {
    // 记录开始时间
    [self recordAlgorithmStartTimestamp];
    
    NSMutableArray <NSNumber *> *arrM = [self fetchOriginalValueArray];
    NSInteger count = arrM.count;
    
    // 第一种方式
    for (NSInteger i = 0; i < (arrM.count -1); i++) {
        BOOL swapped = NO; // 是否已检测完成
        NSInteger lastIndex = 0; // 最后一次发生交换的位置
        for (NSInteger j = 0; j < (count -1); j++) {
            // 若这里的条件是 >=，则变成不稳定排序
            if (arrM[j].integerValue > arrM[j + 1].integerValue) {
                [self swapped:arrM withFormIndex:j withToIndex:(j + 1)];
                lastIndex = j + 1; // lastIndex 以及之后的元素，都是排好序的
                swapped = YES;
            }
        }
        
        count = lastIndex;
        
        // 没有发生交互，证明排序已经完成
        if (swapped == NO) {
            break;
        }
        
        if (count == 0) {
            break;
        }
    }
    
    // 输出执行消耗时间
    [self logAlgorithmConsumeTime:[NSString stringWithFormat:@"%s第一种方式", __func__]];
    
    // 记录开始时间
    [self recordAlgorithmStartTimestamp];
    
    arrM = [self fetchOriginalValueArray];
    count = arrM.count;
    // 第二种方式
    for (NSInteger i = 0; i < count; i++) {
        BOOL swapped = NO; // 是否已检测完成
        for (NSInteger j = 0; j < (count - i -1); j++) {
            // 若这里的条件是 >=，则变成不稳定排序
            if (arrM[j].integerValue > arrM[j + 1].integerValue) {
                [self swapped:arrM withFormIndex:j withToIndex:(j + 1)];
                swapped = YES;
            }
        }
        
        // 没有发生交互，证明排序已经完成
        if (swapped == NO) {
            break;
        }
    }
    
    // 输出执行消耗时间
    [self logAlgorithmConsumeTime:[NSString stringWithFormat:@"%s第二种方式", __func__]];
    
    return [NSString stringWithFormat:@"sort result: %@", [arrM componentsJoinedByString:@","]];
}

/// 再进一步优化：为了优化之前提到的乌龟和兔子问题，可以进行双向的循环，正向循环把最大元素移动到末尾，逆向循环把最小元素移动到最前，这种优化过的冒泡排序，被称为鸡尾酒排序：
- (NSString *)cocktailSort {
    // 记录开始时间
    [self recordAlgorithmStartTimestamp];
    
    NSMutableArray <NSNumber *> *arrM = [self fetchOriginalValueArray];
    NSInteger begin = 0;
    NSInteger end = arrM.count - 1;
    
    while (begin <= end) {
        NSInteger newBegin = end;
        NSInteger newEnd = begin;
        
        // 正向循环把最大元素移动到末尾
        for (NSInteger i = begin; i < end; i++) {
            if (arrM[i].integerValue > arrM[i + 1].integerValue) {
                [self swapped:arrM withFormIndex:i withToIndex:(i + 1)];
                newEnd = i + 1;
            }
        }
        
        end = newEnd - 1; // 最后一次交互的位置
        
        // 逆向循环把最小元素移动到最前
        for (NSInteger j = end; j > begin - 1; j--) {
            if (arrM[j].integerValue > arrM[j + 1].integerValue) {
                [self swapped:arrM withFormIndex:j withToIndex:(j + 1)];
                newBegin = j;
            }
        }
        
        begin = newBegin + 1; // 最后一次交互的位置
    }
    
    // 输出执行消耗时间
    [self logAlgorithmConsumeTime:[NSString stringWithFormat:@"%s", __func__]];
    
    return [NSString stringWithFormat:@"sort result: %@", [arrM componentsJoinedByString:@","]];
}

#pragma mark - Private Methods

#pragma mark - Setter & Getter

@end

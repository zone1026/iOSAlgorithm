//
//  YZQuickSort.m
//  iOSAlgorithm
//
//  Created by hyz on 2021/9/14.
//

#import "YZQuickSort.h"

@implementation YZQuickSort

#pragma mark - Public Methods

- (NSString *)quickSort {
    // 记录开始时间
    [self recordAlgorithmStartTimestamp];
    
    NSMutableArray <NSNumber *> *arrM = [self fetchOriginalValueArray];
    // 执行 挖坑法 快速排序代码块
//    [self potholing_quickSort:arrM withLeft:0 withRight:arrM.count - 1];
    // 执行 指针交换法 快速排序代码块
    [self needleExchange_quickSort:arrM withLeft:0 withRight:arrM.count - 1];
    // 输出执行消耗时间
    [self logAlgorithmConsumeTime:[NSString stringWithFormat:@"%s", __func__]];
    
    return [NSString stringWithFormat:@"array sort result: %@", [arrM componentsJoinedByString:@","]];
}

#pragma mark - Private Methods

/// 挖坑法 处理 快速排序
/// @param arrM 需要处理的数组
/// @param left 数组的左边界(例如，从起始位置开始排序)
/// @param right 数组的右边界(例如，排序截至到数组末尾)
- (void)potholing_quickSort:(NSMutableArray <NSNumber *> *)arrM withLeft:(NSInteger)left withRight:(NSInteger)right {
    if (left >= right) { // 边界传值错误
        return;
    }
    
    NSInteger i = left; // 需要寻找的基准数据索引
    NSInteger j = right;
    NSInteger key = arrM[left].integerValue;
    while (i < j) { // 将基准数据向中间靠拢
        //********** 挖坑法 **********//
        while (i < j && key <= arrM[j].integerValue) {
            j--; // 从右向左找第一个小于key的数
        }
        
        arrM[i] = arrM[j];
        
        while (i < j && key >= arrM[i].integerValue) {
            i++; // 从左向右找第一个大于key的数
        }
        
        arrM[j] = arrM[i];
    }
    
    // 将数据放在基准数据索引位置
    arrM[i] = [NSNumber numberWithInteger:key];
    
    // 根据得到的基准数据索引 递归左边界区域数据
    [self potholing_quickSort:arrM withLeft:left withRight:i - 1];
    // 根据得到的基准数据索引 递归右边界区域数据
    [self potholing_quickSort:arrM withLeft:i + 1 withRight:right];
}

/// 双指针交换法 处理 快速排序
/// @param arrM 需要处理的数组
/// @param left 数组的左边界(例如，从起始位置开始排序)
/// @param right 数组的右边界(例如，排序截至到数组末尾)
- (void)needleExchange_quickSort:(NSMutableArray <NSNumber *> *)arrM withLeft:(NSInteger)left withRight:(NSInteger)right {
    if (left >= right) { // 边界传值错误
        return;
    }
    
    NSInteger i = left; // 需要寻找的基准数据索引
    NSInteger j = right;
    NSInteger key = arrM[left].integerValue;
    while (i < j) { // 将基准数据向中间靠拢
        //********** 指针交换法 **********//
        while (i < j && key <= arrM[j].integerValue) {
            j--; // 从右向左找第一个小于key的数
        }
        
        while (i < j && key >= arrM[i].integerValue) {
            i++; // 从左向右找第一个大于key的数
        }
        
        if (i < j) {
            [self swapped:arrM withFormIndex:i withToIndex:j];
        }
    }
    
    // 将数据放在基准数据索引位置
    [self swapped:arrM withFormIndex:i withToIndex:left];
    
    // 根据得到的基准数据索引 递归左边界区域数据
    [self needleExchange_quickSort:arrM withLeft:left withRight:i - 1];
    // 根据得到的基准数据索引 递归右边界区域数据
    [self needleExchange_quickSort:arrM withLeft:i + 1 withRight:right];
}

#pragma mark - Setter & Getter

@end

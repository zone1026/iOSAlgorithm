//
//  YZInsertionSort.h
//  iOSAlgorithm
//
//  Created by 黄亚州 on 2021/8/21.
//

#import "YZBaseSort.h"

NS_ASSUME_NONNULL_BEGIN

/**
 插入排序思想是，每次只处理一个元素，从后往前查找，找到该元素合适的插入位置，最好的情况下，即正序有序(从小到大)，这样只需要比较n次，不需要移动。因此时间复杂度为O(n) ，最坏的情况下，即逆序有序，这样每一个元素就需要比较n次，共有n个元素，因此实际复杂度为O(n²) 。
 
 优势：对于有序数组或部分有序数组，此排序方法是十分高效的，很适合小规模的数组，很多高级的排序算法都会利用到插入排序。
 
 劣势：如果最小的元素都在最后部分的位置，那么该排序方法就会变得非常费劲了，最后的元素都要比较改元素位置减一次。
 */
@interface YZInsertionSort : YZBaseSort

/// 直接插入排序
/// @return 排序后的数据，用于输出展示
- (NSString *)insertionSort;

/// 折半插入排序
/// @return 排序后的数据，用于输出展示
- (NSString *)binaryInsertionSort;

@end

NS_ASSUME_NONNULL_END

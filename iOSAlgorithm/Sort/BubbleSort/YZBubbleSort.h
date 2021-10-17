//
//  YZBubbleSort.h
//  iOSAlgorithm
//
//  Created by hyz on 2021/8/23.
//

#import "YZBaseSort.h"

NS_ASSUME_NONNULL_BEGIN

/**
 冒泡排序思想是通过无序区中相邻记录关键字间的比较和位置的交换,使关键字最小的记录如气泡一般逐渐往上“漂浮”直至“水面”。 冒泡排序的复杂度，在最好情况下，即正序有序，则只需要比较n次。故，为O(n) ，最坏情况下，即逆序有序，则需要比较(n-1)+(n-2)+……+1，故，为O(n²)。
 */
@interface YZBubbleSort : YZBaseSort

/// 糟糕的一种排序逻辑，需要(n - 1)² 循环处理
/// @return 排序后的数据，用于输出展示
- (NSString *)terribleSort;

/// 冒泡排序优化处理
/// @return 排序后的数据，用于输出展示
- (NSString *)optimizeSort;

/// 双向的循环，正向循环把最大元素移动到末尾，逆向循环把最小元素移动到最前，这种优化过的冒泡排序，被称为鸡尾酒排序
/// @return 排序后的数据，用于输出展示
- (NSString *)cocktailSort;

@end

NS_ASSUME_NONNULL_END

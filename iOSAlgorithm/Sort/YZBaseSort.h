//
//  YZBaseSort.h
//  iOSAlgorithm
//
//  Created by 黄亚州 on 2021/8/21.
//

#import "YZBaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZBaseSort : YZBaseObject

/// 初始化对象
/// @param valueArr 排序数据集合
- (instancetype)initWithValueArray:(NSArray <NSNumber *> *)valueArr;

/// 获取原始排序数据集合
/// @return 所需要排序数据
- (nonnull NSMutableArray <NSNumber *> *)fetchOriginalValueArray;

/// 交换数组下的两个索引数据
/// @param arrM 需要交换的数组
/// @param formIndex 需要移动的数据索引
/// @param toIndex 移动至的数组索引
- (void)swapped:(NSMutableArray *)arrM withFormIndex:(NSInteger)formIndex withToIndex:(NSInteger)toIndex;

@end

NS_ASSUME_NONNULL_END

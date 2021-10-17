//
//  YZBaseSort.m
//  iOSAlgorithm
//
//  Created by 黄亚州 on 2021/8/21.
//

#import "YZBaseSort.h"

@interface YZBaseSort ()
/// 原始数据集合
@property (nonatomic, strong, nonnull) NSArray <NSNumber *> *originalArr;

@end

@implementation YZBaseSort

#pragma mark - Init

- (instancetype)initWithValueArray:(NSArray<NSNumber *> *)valueArr {
    if (self = [super init]) {
        if (valueArr == nil) {
            valueArr = @[];
        }
        
        self.originalArr = valueArr;
    }
    
    return self;
}

#pragma mark - Public Method

- (nonnull NSMutableArray <NSNumber *> *)fetchOriginalValueArray {
    return [NSMutableArray arrayWithArray:self.originalArr];
}

- (void)swapped:(NSMutableArray *)arrM withFormIndex:(NSInteger)formIndex withToIndex:(NSInteger)toIndex {
    if (arrM == nil) {
        return;
    }
    
    if (formIndex == toIndex || formIndex < 0 ||  arrM.count <= formIndex || toIndex < 0 || arrM.count <= toIndex) {
        return;
    }
    
    id tempData = [arrM objectAtIndex:toIndex];
    arrM[toIndex] = arrM[formIndex];
    arrM[formIndex] = tempData;
}

@end

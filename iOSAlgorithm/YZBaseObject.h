//
//  YZBaseObject.h
//  iOSAlgorithm
//
//  Created by hyz on 2021/8/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZBaseObject : NSObject

/// 记录算法开始执行时间戳
- (void)recordAlgorithmStartTimestamp;

/// 输出算法执行耗费时间
/// @param preStr 耗费时间前缀信息
- (void)logAlgorithmConsumeTime:(NSString *)preStr;

@end

NS_ASSUME_NONNULL_END

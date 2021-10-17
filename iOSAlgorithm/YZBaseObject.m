//
//  YZBaseObject.m
//  iOSAlgorithm
//
//  Created by hyz on 2021/8/23.
//

#import "YZBaseObject.h"

@interface YZBaseObject ()
/// 开始执行算法的时间
@property (nonatomic, assign) NSTimeInterval startTimestamp;

@end

@implementation YZBaseObject

#pragma mark - Init

#pragma mark - Public Methods

- (void)recordAlgorithmStartTimestamp {
    self.startTimestamp = [NSDate date].timeIntervalSince1970;
}

- (void)logAlgorithmConsumeTime:(NSString *)preStr {
    if (self.startTimestamp < 0.0f) {
        NSLog(@"抱歉，您未记录执行开始时间，无法计算出执行所耗费时间");
    }
    
    NSTimeInterval currentTimestamp = [NSDate date].timeIntervalSince1970;
    NSTimeInterval interval = currentTimestamp - self.startTimestamp;
    
    NSString *str = [NSString stringWithFormat:@"算法耗时：%f秒", interval];
    if (preStr == nil || preStr.length <= 0) {
        NSLog(@"%@", str);
    }
    
    NSLog(@"%@，%@", preStr, str);
    self.startTimestamp = 0.0f;
}

#pragma mark - Private Methods

@end

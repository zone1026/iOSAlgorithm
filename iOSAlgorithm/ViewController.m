//
//  ViewController.m
//  iOSAlgorithm
//
//  Created by 黄亚州 on 2021/8/21.
//

#import "ViewController.h"

#import "YZSortExample.h"
#import "YZBinaryTreeExample.h"
#import "YZDemo.h"

@interface ViewController ()
@property (nonatomic, strong) NSObject *objc1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *dict = @{@"0": @"无任何证书",
                           @"1": @"英语四级",
                           @"2": @"英语六级",
                           @"3": @"公共英语三级",
                           @"4": @"计算机一级",
                           @"5": @"计算机二级",
                           @"6": @"护士资格证",
                           @"7": @"教师资格证"};
    
    NSObject *obj1 = [NSObject new];
    NSObject *obj2 = obj1;
    __weak NSObject *obj3 = obj1;
    NSObject *obj4 = obj1;
    NSObject *obj5 = obj3;
    printf("obj1:%ld\n", CFGetRetainCount((__bridge CFTypeRef)(obj1)));
    printf("obj2:%ld\n", CFGetRetainCount((__bridge CFTypeRef)(obj2)));
    printf("obj3:%ld\n", CFGetRetainCount((__bridge CFTypeRef)(obj3)));
    printf("obj4:%ld\n", CFGetRetainCount((__bridge CFTypeRef)(obj4)));
    printf("obj5:%ld\n", CFGetRetainCount((__bridge CFTypeRef)(obj5)));
    
    self.objc1 = [NSObject new];

    printf("objc1:%ld\n", CFGetRetainCount((__bridge CFTypeRef)(self.objc1)));
    
    printf("objc1:%ld\n", CFGetRetainCount((__bridge CFTypeRef)(self.objc1)));
    
    NSObject *objc = [NSObject new];
    NSLog(@"%ld", CFGetRetainCount((__bridge CFTypeRef)objc));
    
    void(^block1)(void) = ^{
        NSLog(@"%ld", CFGetRetainCount((__bridge CFTypeRef)objc));
    };
    block1();
    
    void(^__weak block2)(void) = ^{
        NSLog(@"%ld", CFGetRetainCount((__bridge CFTypeRef)objc));
    };
    block2();
    
    void(^block3)(void) = [block2 copy];
    block3();
    
    __block NSObject *obj = [NSObject new];
    void(^block4)(void) = ^{
        NSLog(@"%ld", CFGetRetainCount((__bridge CFTypeRef)obj));
    };
    block4();
    
    Class cls = [YZDemo class];
    void *kc = &cls;
    [(__bridge id)kc sysSomething];
    
    YZDemo *demo = [[YZDemo alloc] init];
    void *p = (__bridge void *)demo;
    id o = (__bridge id)p;
    
    // 排序示例
    YZSortExample *sortExample = [[YZSortExample alloc] init];
    [sortExample startSortExample];

    // 二叉树示例
    YZBinaryTreeExample *binaryTreeExample = [[YZBinaryTreeExample alloc] init];
//    [binaryTreeExample startBinaryTreeExample];
}

@end

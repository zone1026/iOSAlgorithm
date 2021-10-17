//
//  ViewController.m
//  iOSAlgorithm
//
//  Created by 黄亚州 on 2021/8/21.
//

#import "ViewController.h"

#import "YZSortExample.h"
#import "YZBinaryTreeExample.h"

@interface ViewController ()
@property (nonatomic, strong) NSObject *objc1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 排序示例
    YZSortExample *sortExample = [[YZSortExample alloc] init];
    [sortExample startSortExample];

    // 二叉树示例
    YZBinaryTreeExample *binaryTreeExample = [[YZBinaryTreeExample alloc] init];
    [binaryTreeExample startBinaryTreeExample];
}

@end

//
//  YZBinaryTreeExample.m
//  iOSAlgorithm
//
//  Created by hyz on 2021/8/23.
//

#import "YZBinaryTreeExample.h"
#import "YZBinaryTree.h"

@implementation YZBinaryTreeExample

#pragma mark - Init

#pragma mark - Public Methods

- (void)startBinaryTreeExample {
    NSArray *arr = @[@4,@2,@7,@1,@3,@6,@9];
    YZBinaryTree *tree = [[YZBinaryTree alloc] initWithValues:arr];
    [tree treeFirstInformationWithNode:tree.rootTreeNode resultBlock:^(NSInteger value) {
        NSLog(@"first node value: %ld", (long)value);
    }];
    
    [tree treeMiddleInformationWithNode:tree.rootTreeNode resultBlock:^(NSInteger value) {
        NSLog(@"middle node value: %ld", (long)value);
    }];
    
    [tree treeLastInformationWithNode:tree.rootTreeNode resultBlock:^(NSInteger value) {
        NSLog(@"last node value: %ld", (long)value);
    }];
    
    NSLog(@"tree depath = %ld", [tree depathOfTree:tree.rootTreeNode]);
    NSLog(@"tree node count = %ld", [tree numberOfLeafNode:tree.rootTreeNode]);
    
    [tree isFullBinaryTree:tree.rootTreeNode];
    [tree isCompleteBinaryTree:tree.rootTreeNode];
    
    [tree insertValue2BinaryTree:5];
    
    [tree deleteValueInBinaryTree:1];
    
    [tree deleteValueInBinaryTree:2];
    
    [tree deleteValueInBinaryTree:4];
    
    YZBinaryTreeNode *node = [tree invertBinaryTree:tree.rootTreeNode];
    
    [tree treeFirstInformationWithNode:node resultBlock:^(NSInteger value) {
        NSLog(@"first node value: %ld", (long)value);
    }];
    
    [tree treeMiddleInformationWithNode:node resultBlock:^(NSInteger value) {
        NSLog(@"middle node value: %ld", (long)value);
    }];
    
    [tree treeLastInformationWithNode:node resultBlock:^(NSInteger value) {
        NSLog(@"last node value: %ld", (long)value);
    }];
    
    YZBinaryTree *tempTree = [[YZBinaryTree alloc] initWithValues:@[@4, @3, @5, @2, @6, @1, @7]];
    YZBinaryTreeNode *tempNode = [tempTree invertBinaryTreeWithoutRecursion:tree.rootTreeNode];
    [tempTree treeMiddleInformationWithNode:tempNode resultBlock:^(NSInteger value) {
        NSLog(@"middle node value: %ld", (long)value);
    }];
}

#pragma mark - Private Methods

@end

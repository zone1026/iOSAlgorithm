//
//  YZBinaryTree.m
//  iOSAlgorithm
//
//  Created by hyz on 2021/8/23.
//

#import "YZBinaryTree.h"

@implementation YZBinaryTree

#pragma mark - Init

- (instancetype)initWithValues:(NSArray<NSNumber *> *)values {
    YZBinaryTreeNode *node = nil;
    for (NSNumber *value in values) {
        node = [self addTreeNode:node withValue:value.integerValue];
        if (self.rootTreeNode == nil) {
            self.rootTreeNode = node;
        }
    }
    
    return self;
}

#pragma mark - Public Methods

- (YZBinaryTreeNode *)invertBinaryTreeWithoutRecursion:(YZBinaryTreeNode *)rootNode {
    if (rootNode == nil) {
        return nil;
    }
    
    if (rootNode.leftNode == nil && rootNode.rightNode == nil) {
        return rootNode;
    }
    
    NSMutableArray *queueArrM = [NSMutableArray arrayWithCapacity:3];
    [queueArrM addObject:rootNode]; // 压入根节点
    while (queueArrM.count > 0) {
        YZBinaryTreeNode *node = queueArrM.firstObject;
        [queueArrM removeObjectAtIndex:0];
        
        YZBinaryTreeNode *tempNode = node.leftNode;
        node.leftNode = node.rightNode;
        node.rightNode = tempNode;
        
        if (node.leftNode != nil) {
            [queueArrM addObject:node.leftNode];
        }
        
        if (node.rightNode != nil) {
            [queueArrM addObject:node.rightNode];
        }
    }
    
    return rootNode;
}

- (YZBinaryTreeNode *)invertBinaryTree:(YZBinaryTreeNode *)rootNode {
    if (rootNode == nil) {
        return nil;
    }
    
    if (rootNode.leftNode == nil && rootNode.rightNode == nil) {
        return rootNode;
    }
    
    YZBinaryTreeNode *tempNode = rootNode.leftNode;
    rootNode.leftNode = rootNode.rightNode;
    rootNode.rightNode = tempNode;
    
    [self invertBinaryTree:rootNode.leftNode];
    [self invertBinaryTree:rootNode.rightNode];
    
    return rootNode;
}

- (NSInteger)depathOfTree:(YZBinaryTreeNode *)rootNode {
    if (rootNode == nil) {
        return 0;
    }
    
    if (rootNode.leftNode == nil && rootNode.rightNode == nil) {
        return 1;
    }
    
    NSInteger leftDepath = [self depathOfTree:rootNode.leftNode];
    NSInteger rightDepath = [self depathOfTree:rootNode.rightNode];
    
    return MAX(leftDepath, rightDepath) + 1;
}

- (NSInteger)widthOfTree:(YZBinaryTreeNode *)rootNode {
    if (rootNode == nil) {
        return 0;
    }
    
    // 最大宽度
    NSInteger maxWidth = 1;
    // 当前层数的宽度
    NSInteger currentWidth = 0;
    
    NSMutableArray *queueArrM = [NSMutableArray arrayWithCapacity:3];
    [queueArrM addObject:rootNode];
    
    while (queueArrM.count > 0) {
        currentWidth = queueArrM.count;
        for (NSInteger i = 0; i < currentWidth; i++) {
            YZBinaryTreeNode *node = queueArrM.firstObject;
            [queueArrM removeObjectAtIndex:0];
            
            if (node.leftNode != nil) {
                [queueArrM addObject:node.leftNode];
            }
            if (node.rightNode != nil) {
                [queueArrM addObject:node.rightNode];
            }
        }
        
        maxWidth = MAX(maxWidth, queueArrM.count);
    }
    
    return maxWidth;
}

- (NSInteger)numberOfNodesInTree:(YZBinaryTreeNode *)rootNode {
    if (rootNode == nil) {
        return 0;
    }
    
    return [self numberOfNodesInTree:rootNode.leftNode] + [self numberOfNodesInTree:rootNode.rightNode] + 1;
}

- (NSInteger)numberOfLeafNode:(YZBinaryTreeNode *)rootNode {
    if (rootNode == nil) {
        return 0;
    }
    
    if (rootNode.leftNode == nil && rootNode.rightNode == nil) {
        return 1;
    }
    
    return [self numberOfLeafNode:rootNode.leftNode] + [self numberOfLeafNode:rootNode.rightNode];
}

- (NSMutableArray *)pathOfTreeNode:(YZBinaryTreeNode *)treeNode inTree:(YZBinaryTreeNode *)rootNode {
    NSMutableArray *pathArrM = [NSMutableArray arrayWithCapacity:3];
    [self isFoundTreeNode:treeNode inTree:rootNode routePath:pathArrM];
    
    return pathArrM;
}

- (void)treeFirstInformationWithNode:(YZBinaryTreeNode *)rootNode resultBlock:(void (^)(NSInteger value))block {
    if (block != nil) {
        block(rootNode.value);
    }
    
    if (rootNode.leftNode != nil) {
        [self treeFirstInformationWithNode:rootNode.leftNode resultBlock:block];
    }
    
    if (rootNode.rightNode != nil) {
        [self treeFirstInformationWithNode:rootNode.rightNode resultBlock:block];
    }
}

- (void)treeMiddleInformationWithNode:(YZBinaryTreeNode *)rootNode resultBlock:(void (^)(NSInteger value))block {
    if (rootNode.leftNode != nil) {
        [self treeMiddleInformationWithNode:rootNode.leftNode resultBlock:block];
    }
    
    if (block != nil) {
        block(rootNode.value);
    }
    
    if (rootNode.rightNode != nil) {
        [self treeMiddleInformationWithNode:rootNode.rightNode resultBlock:block];
    }
}

- (void)treeLastInformationWithNode:(YZBinaryTreeNode *)rootNode resultBlock:(void (^)(NSInteger value))block {
    if (rootNode.leftNode != nil) {
        [self treeLastInformationWithNode:rootNode.leftNode resultBlock:block];
    }
    
    if (rootNode.rightNode != nil) {
        [self treeLastInformationWithNode:rootNode.rightNode resultBlock:block];
    }
    
    if (block != nil) {
        block(rootNode.value);
    }
}

- (void)levelTraverseBinaryTree:(YZBinaryTreeNode *)rootNode handle:(void(^)(YZBinaryTreeNode *treeNode))handler {
    if (rootNode == nil) {
        return;
    }
    
    NSMutableArray *queueArrM = [NSMutableArray arrayWithCapacity:3];
    [queueArrM addObject:rootNode];
    
    while (queueArrM.count > 0) {
        YZBinaryTreeNode *node = queueArrM.firstObject;
        if (handler != nil) {
            handler(node);
        }
        
        [queueArrM removeObjectAtIndex:0];
        // BFS 广度优先
        if (node.leftNode != nil) {
            [queueArrM addObject:node.leftNode];
        }
        
        if (node.rightNode != nil) {
            [queueArrM addObject:node.rightNode];
        }
    }
}

/// 层次遍历（深度优先，纵向遍历）
/// @param rootNode 根节点
/// @param handler 处理结果
- (void)levelLengthwaysBinaryTree:(YZBinaryTreeNode *)rootNode handle:(void(^)(YZBinaryTreeNode *treeNode))handler {
    if (rootNode == nil) {
        return;
    }

    if (handler != nil) {
        handler(rootNode);
    }
    
    // DFS 深度优先
    if (rootNode.leftNode != nil) {
        [self levelLengthwaysBinaryTree:rootNode.leftNode handle:handler];
    }
    if (rootNode.rightNode != nil) {
        [self levelLengthwaysBinaryTree:rootNode.rightNode handle:handler];
    }
}

- (YZBinaryTreeNode *)findTreeNodeAtIndex:(NSInteger)index withTree:(YZBinaryTreeNode *)rootNode {
    // 结点不存在，查找的位置不符合规范
    if (rootNode == nil || index < 0) {
        return nil;
    }
    
    NSMutableArray *queueArrM = [NSMutableArray arrayWithCapacity:3];
    // 压入根结点
    [queueArrM addObject:rootNode];
    
    while (queueArrM.count > 0) {
        YZBinaryTreeNode *node = queueArrM.firstObject;
        if (index == 0) {
            return node;
        }
        
        // 仿照队列FIFO，t移除最前面的结点
        [queueArrM removeObjectAtIndex:0];
        
        index --;
        
        // 按照从左到右依次压入结点
        if (node.leftNode != nil) {
            [queueArrM addObject:node.leftNode];
        }
        
        if (node.rightNode != nil) {
            [queueArrM addObject:node.rightNode];
        }
    }
    
    // 遍历完，还没有找到位置，返回nil
    return nil;
}

- (BOOL)isFullBinaryTree:(YZBinaryTreeNode *)rootNode {
    if (rootNode == nil) {
        return NO;
    }
    
    // 深度
    NSInteger depth = [self depathOfTree:rootNode];
    // 二叉树叶子节点数
    NSInteger leafNum = [self numberOfLeafNode:rootNode];
    
    // 是否满足：叶子树 = 2^(深度 - 1)
    if (leafNum == pow(2, depth - 1)) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isCompleteBinaryTree:(YZBinaryTreeNode *)rootNode {
    // 完全二叉树：若设二叉树的高度为h，除第h层外，其它各层的节点数都达到最大个数
    // 第h层有叶子节点，并且叶子节点都是从左到右依次排布
    
    if (rootNode == nil) {
        return NO;
    }
    
    if (rootNode.leftNode == nil && rootNode.rightNode == nil) {
        return YES;
    }
    
    // 违反【连续集中在最左边】规则
    if (rootNode.leftNode == nil && rootNode.rightNode != nil) {
        return NO;
    }
    
    /**
     按层次遍历节点，找到满足完全二叉树的条件：
     条件1：如果某个节点的右子树不为空，则它的左子树必须不为空
     条件2：如果某个节点的右子树为空，则排在它后面的节点必须没有孩子节点
     排在该节点后面的节点有2种：1）同层次的后面的节点 2）同层次的前面的节点的孩子节点
     */
    
    NSMutableArray *queueArrM = [NSMutableArray arrayWithCapacity:3];
    [queueArrM addObject:rootNode];
    // 是否是完全二叉树
    BOOL completeTree = NO;
    while (queueArrM.count > 0) {
        YZBinaryTreeNode *node = queueArrM.firstObject;
        [queueArrM removeObjectAtIndex:0];
        // 左子树为空且右子树不为空，则不是完全二叉树
        if (node.leftNode == nil && node.rightNode != nil) {
            return NO;
        }
        
        // 前面的节点已满足完全二叉树，如果还有孩子节点，则不是完全二叉树
        if (completeTree && (node.leftNode != nil || node.rightNode != nil)) {
            return NO;
        }
        
        // 右子树为空，则已满足完全二叉树
        if (node.rightNode == nil) {
            completeTree = YES;
        }
        
        if (node.leftNode != nil) {
            [queueArrM addObject:node.leftNode];
        }
        if (node.rightNode != nil) {
            [queueArrM addObject:node.rightNode];
        }
    }
    
    return completeTree;
}

- (BOOL)isAVLBinaryTree:(YZBinaryTreeNode *)rootNode {
    // AVL树：是一颗空树或它的左右两个子树的高度差的绝对值不超过1，并且左右两个子树都是一颗平衡二叉树
    
    // static修饰局部变量时，在程序中只有一份内存，并延长其生命周期
    static NSInteger height;
    
    if (rootNode == nil) { // 是一颗空树
        height = 0;
        return YES;
    }
    
    if (rootNode.leftNode == nil && rootNode.rightNode == nil) {
        height  = 1;
        return YES;
    }
    
    // 左子树是否是AVL树
    BOOL isAVLLeftTree = [self isAVLBinaryTree:rootNode.leftNode];
    NSInteger heightLeft = height;
    
    // 右子树是否是AVL树
    BOOL isAVLRightTree = [self isAVLBinaryTree:rootNode.rightNode];
    NSInteger heightRight = height;
    
    height = MAX(heightLeft, heightRight) + 1;
    
    // 左右两颗子树的高度差的绝对值不超过1且两个子树都是AVL树
    if (ABS(heightLeft - heightRight) <= 1 && isAVLLeftTree == YES && isAVLRightTree == YES) {
        return YES;
    }
    
    return NO;
}

- (YZBinaryTreeNode *)insertValue2BinaryTree:(NSInteger)value {
    if (self.rootTreeNode == nil) {
        self.rootTreeNode = [[YZBinaryTreeNode alloc] initWithValue:value];
        return self.rootTreeNode;
    }
    /**
    思路：插入数据x，从根节点开始，不断比较节点与x的大小。
        若x小于节点，下一次比较x与节点的左子树，反之，比较x与节点的右子树。
        直到遇到一个空的节点，插入数据。（我们不考虑插入重复数据）
     */
    YZBinaryTreeNode *tempNode = self.rootTreeNode; // 寻找插入的节点
    while (tempNode != nil) {
        if (value < tempNode.value) { // 小于父节点值时，插入到左子树序列中
            if (tempNode.leftNode == nil) { // 左子树为空，则已找到合适的节点
                tempNode.leftNode = [[YZBinaryTreeNode alloc] initWithValue:value];
                break; // 结束循环
            } else {
                tempNode = tempNode.leftNode; // 继续下轮循环
            }
        } else if (value > tempNode.value) { // 小于父节点值时，插入到右子树序列中
            if (tempNode.rightNode == nil) { // 右子树为空，则已找到合适的节点
                tempNode.rightNode = [[YZBinaryTreeNode alloc] initWithValue:value];
                break; // 结束循环
            } else {
                tempNode = tempNode.rightNode; // 继续下轮循环
            }
        } else {
            NSLog(@"重复的数据不添加到树中");
        }
    }
    
    return tempNode;
}

- (YZBinaryTreeNode *)deleteValueInBinaryTree:(NSInteger)value {
    if (self.rootTreeNode == nil) {
        return nil;
    }
    
    /**
     1. 删除节点是树叶，则直接删除。
     2. 被删除的节点只有一个子节点，此时只需要将删除节点的上一个节点的指向该节点的指针指向该节点唯一的子节点。
     3.被删除的节点有两个子节点，这种情况是最麻烦的。我们采用的思想是将该节点的该节点右子树中最小的一个节点的值覆盖该节点中的值，然后再删除该节点的右子树中的最小的那个子节点。因为，该节点的右子树中的最小的那个子节点的值刚好大于被删除节点的左子树中所有的值，又小于被删除节点的右子树中所有的值。最小的那个子节点不可能有右子树，不然它就不是最小的节点，删除该节点就转换为删除一个只有一个子节点的节点，即第二种情况
     */
    
    YZBinaryTreeNode *tempNode = self.rootTreeNode; // 寻找要删除的节点
    YZBinaryTreeNode *deletePreNode = nil;
    while (tempNode != nil) {
        if (value < tempNode.value) { // 小于当前节点值时，在左子树序列中查找
            deletePreNode = tempNode;
            tempNode = tempNode.leftNode;
        } else if (value > tempNode.value) {
            deletePreNode = tempNode;
            tempNode = tempNode.rightNode;
        } else { // 找到了对应节点
            if (tempNode.leftNode == nil && tempNode.rightNode == nil) { // 删除节点是叶子节点，则直接删除。
                if (deletePreNode.leftNode == tempNode) { // 要删除的节点是左子树
                    deletePreNode.leftNode = nil;
                } else {
                    deletePreNode.rightNode = nil;
                }
                break;
            }
        
            if (tempNode.leftNode != nil && tempNode.rightNode != nil) { // 被删除的节点有两个子节点
                YZBinaryTreeNode *minNode = [self findMinNodeParentNode:tempNode.rightNode]; // 查找右子树序列中最小的一个节点的父节点
                // 赋值最小节点给找到的节点
                tempNode.value = minNode.leftNode.value;
                // 删除最小节点
                minNode.leftNode = nil;
            } else { // 被删除的节点只有一个子节点，此时只需要将删除节点的上一个节点的指向该节点的指针指向该节点唯一的子节点。
                YZBinaryTreeNode *nextNode = tempNode.leftNode ? tempNode.leftNode : tempNode.rightNode;
                if (deletePreNode.leftNode == tempNode) { // 要删除的节点是左子树
                    deletePreNode.leftNode = nextNode;
                } else {
                    deletePreNode.rightNode = nextNode;
                }
                
                break;
            }
        }
    }
    
    return tempNode;
}

- (YZBinaryTreeNode *)findMinNode:(YZBinaryTreeNode *)parentNode {
    if (parentNode == nil) {
        return nil;
    }
    
    YZBinaryTreeNode *tempNode = parentNode;
    while (tempNode.leftNode != nil) { // 最小的节点一定在左节点序列中
        tempNode = tempNode.leftNode;
    }
    
    return tempNode;
}

- (YZBinaryTreeNode *)findMinNodeParentNode:(YZBinaryTreeNode *)parentNode {
    if (parentNode == nil) {
        return nil;
    }
    
    YZBinaryTreeNode *tempNode = parentNode;
    while (tempNode.leftNode != nil) { // 最小的节点一定在左节点序列中
        if (tempNode.leftNode.leftNode == nil) {
            break;
        } else {
            tempNode = tempNode.leftNode;
        }
    }
    
    return tempNode;
}

#pragma mark - Private Methods

/// 按照二叉排序树、二叉搜索树、二叉查找树的规则添加子树节点
- (YZBinaryTreeNode *)addTreeNode:(YZBinaryTreeNode *)treeNode withValue:(NSInteger)value {
    if (treeNode == nil) {
        treeNode = [[YZBinaryTreeNode alloc] init];
        treeNode.value = value;
    } else if (value <= treeNode.value) { // 值小于根节点，则插入到左子树
        treeNode.leftNode = [self addTreeNode:treeNode.leftNode withValue:value];
    } else { // 值大于根节点，则插入到右子树
        treeNode.rightNode = [self addTreeNode:treeNode.rightNode withValue:value];
    }
    
    return treeNode;
}

- (BOOL)isFoundTreeNode:(YZBinaryTreeNode *)treeNode inTree:(YZBinaryTreeNode *)rootNode routePath:(NSMutableArray *)pathArrM {
    if (treeNode == nil || rootNode == nil) {
        return NO;
    }
    
    // 找到节点
    if (rootNode == treeNode) {
        [pathArrM addObject:rootNode];
        return YES;
    }
    // 压入根节点，进行递归
    [pathArrM addObject:rootNode];
    // 先从左子树中查找
    BOOL find = [self isFoundTreeNode:treeNode inTree:rootNode.leftNode routePath:pathArrM];
    // 未找到，再从右子树查找
    if (find == NO) {
        find = [self isFoundTreeNode:treeNode inTree:rootNode.rightNode routePath:pathArrM];
    }
    
    // 如果2边都没查找到，则弹出此根节点
    if (find == NO) {
        [pathArrM removeLastObject];
    }
    
    return find;
}

#pragma mark - Setter & Getter

@end

@implementation YZBinaryTreeNode

- (instancetype)initWithValue:(NSInteger)value {
    if (self = [super init]) {
        _value = value;
    }
    
    return self;
}

@end

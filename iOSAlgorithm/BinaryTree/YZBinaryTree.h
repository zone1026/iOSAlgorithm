//
//  YZBinaryTree.h
//  iOSAlgorithm
//
//  Created by hyz on 2021/8/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class YZBinaryTreeNode;
@interface YZBinaryTree : NSObject

/// 根节点
@property (nonatomic, strong) YZBinaryTreeNode *rootTreeNode;

/// 生成二叉树
/// @param values values 数组
/// @return 二叉树
- (instancetype)initWithValues:(NSArray<NSNumber *> *)values;

/// 翻转二叉树（非递归）
/// @param rootNode 根节点
/// @return 翻转后的树根节点（其实就是原二叉树的根节点）
- (YZBinaryTreeNode *)invertBinaryTreeWithoutRecursion:(YZBinaryTreeNode *)rootNode;

/// 翻转二叉树（又叫：二叉树的镜像）
/// @param rootNode 根节点
/// @return 翻转后的树根节点（其实就是原二叉树的根节点）
- (YZBinaryTreeNode *)invertBinaryTree:(YZBinaryTreeNode *)rootNode;

/// 二叉树深度
/// @param rootNode 根节点
/// @return 二叉树的深度
- (NSInteger)depathOfTree:(YZBinaryTreeNode *)rootNode;

/// 二叉树的宽度，层级中最多的节点个数
/// @param rootNode 根节点
/// @return 二叉树的宽度
- (NSInteger)widthOfTree:(YZBinaryTreeNode *)rootNode;

/// 二叉树所有节点数  节点数=左子树节点数+右子树节点数+1（根节点）
/// @param rootNode 根节点
/// @return 二叉树的所有节点数
- (NSInteger)numberOfNodesInTree:(YZBinaryTreeNode *)rootNode;

/// 二叉树下的叶子节点个数
/// @param rootNode 根节点
/// @return 二叉树下的叶子节点个数
- (NSInteger)numberOfLeafNode:(YZBinaryTreeNode *)rootNode;

/// 二叉树中某个节点到根节点的路径
/// @param treeNode 某个节点
/// @param rootNode 根节点
/// @return 二叉树中某个节点到根节点的节点结合
- (NSMutableArray *)pathOfTreeNode:(YZBinaryTreeNode *)treeNode inTree:(YZBinaryTreeNode *)rootNode;

/// 先序遍历、前序遍历（父左右）
/// @param rootNode 根节点
/// @param block 结果回调
- (void)treeFirstInformationWithNode:(YZBinaryTreeNode *)rootNode resultBlock:(void (^)(NSInteger value))block;

/// 中序遍历（左父右）
/// @param rootNode 根节点
/// @param block 结果回调
- (void)treeMiddleInformationWithNode:(YZBinaryTreeNode *)rootNode resultBlock:(void (^)(NSInteger value))block;

/// 后序遍历（左右父）
/// @param rootNode 根节点
/// @param block 结果回调
- (void)treeLastInformationWithNode:(YZBinaryTreeNode *)rootNode resultBlock:(void (^)(NSInteger value))block;

/// 层次遍历（广度优先，横向遍历）
/// @param rootNode 根节点
/// @param handler 处理结果
- (void)levelTraverseBinaryTree:(YZBinaryTreeNode *)rootNode handle:(void(^)(YZBinaryTreeNode *treeNode))handler;

/// 层次遍历（深度优先，纵向遍历）
/// @param rootNode 根节点
/// @param handler 处理结果
- (void)levelLengthwaysBinaryTree:(YZBinaryTreeNode *)rootNode handle:(void(^)(YZBinaryTreeNode *treeNode))handler;

/// 查找二叉树某个位置的结点
/// @param index 按层次便利树是的位置（从0开始）
/// @param rootNode 树根结点
/// @return 结点
- (YZBinaryTreeNode *)findTreeNodeAtIndex:(NSInteger)index withTree:(YZBinaryTreeNode *)rootNode;

/// 是否是满二叉树； 满二叉树：除了叶节点外每一个节点都有左右子叶且叶节点都处在最底层的二叉树
/// @param rootNode 根节点
/// @return 是否是满二叉树
- (BOOL)isFullBinaryTree:(YZBinaryTreeNode *)rootNode;

/// 判断是否是完全二叉树；完全二叉树：若设二叉树的高度为h，除第h层外，其它各层的节点数都达到最大个数，第h层有叶子节点，并且叶子节点都是从左到右依次排布
/// @param rootNode 根节点
/// @return 是否是完全二叉树
- (BOOL)isCompleteBinaryTree:(YZBinaryTreeNode *)rootNode;

/// 是否是AVL树（平衡二叉树）；AVL树：是一颗空树或它的左右两个子树的高度差的绝对值不超过1，并且左右两个子树都是一颗平衡二叉树
/// @param rootNode 根节点
/// @return 是否是AVL树
- (BOOL)isAVLBinaryTree:(YZBinaryTreeNode *)rootNode;

/// 插入新值到二叉树中，默认按照不存在重复数据处理
/// @param value 数据
/// @return 插入处的节点
- (YZBinaryTreeNode *)insertValue2BinaryTree:(NSInteger)value;

/// 在二叉树中删除某个节点
/// @param value 节点数据
/// @return 需要删除的节点
- (YZBinaryTreeNode *)deleteValueInBinaryTree:(NSInteger)value;

/// 查找父节点下的最小节点
/// @param parentNode 父节点
/// @return 最小的节点
- (YZBinaryTreeNode *)findMinNode:(YZBinaryTreeNode *)parentNode;

/// 查找父节点下的最小节点的父节点
/// @param parentNode 父节点
/// @return 最小的节点的父节点
- (YZBinaryTreeNode *)findMinNodeParentNode:(YZBinaryTreeNode *)parentNode;

@end

@interface YZBinaryTreeNode : NSObject
/// 节点承载的数据
@property (nonatomic, assign) NSInteger value;
/// 节点的左子树
@property (nonatomic, strong, nullable) YZBinaryTreeNode *leftNode;
/// 节点的右子树
@property (nonatomic, strong, nullable) YZBinaryTreeNode *rightNode;

/// 初始化节点对象
/// @param value 节点数据
/// @return 节点对象
- (instancetype)initWithValue:(NSInteger)value;

@end

NS_ASSUME_NONNULL_END

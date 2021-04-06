import Foundation

public class Solution617 {
    public init() {}
    public func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let lhs = root1 else { return root2 }
        guard let rhs = root2 else { return root1 }
        let node = TreeNode(lhs.val + rhs.val)
        node.left = mergeTrees(lhs.left, rhs.left)
        node.right = mergeTrees(lhs.right, rhs.right)
        return node
    }
}

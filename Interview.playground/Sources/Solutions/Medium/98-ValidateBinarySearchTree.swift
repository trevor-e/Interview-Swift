import Foundation

/// This one is easy to mess up. You have to pass down the appropriate min/max values from
/// the previous node parent since the BST properties have to hold true for each node.
/// Prime the search with min/max values. This could also be solved with in-order traversal.
public class Solution98 {
    public init() {}
    public func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        return isValid(root, min: Int.min, max: Int.max)
    }
    private func isValid(_ node: TreeNode?, min: Int, max: Int) -> Bool {
        guard let node = node else { return true }
        if node.val > min && node.val < max {
            return isValid(node.left, min: min, max: node.val)
                && isValid(node.right, min: node.val, max: max)
        } else {
            return false
        }
    }
}

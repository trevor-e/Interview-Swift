import Foundation

public class Solution112 {
    public init() {}
    public func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        let newSum = targetSum - root.val
        if root.left == nil && root.right == nil && newSum == 0 {
            return true
        } else {
            return hasPathSum(root.left, newSum) || hasPathSum(root.right, newSum)
        }
    }
}

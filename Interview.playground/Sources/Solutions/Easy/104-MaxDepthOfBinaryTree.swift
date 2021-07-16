import Foundation

public class Solution104 {
    public init() {}
    public func maxDepth(_ root: TreeNode?) -> Int {
        maxDepth(root, 0)
    }
    private func maxDepth(_ root: TreeNode?, _ depth: Int) -> Int {
        guard let root = root else { return depth }
        let depth = depth + 1
        let leftDepth = maxDepth(root.left, depth)
        let rightDepth = maxDepth(root.right, depth)
        return max(leftDepth, rightDepth)
    }
}

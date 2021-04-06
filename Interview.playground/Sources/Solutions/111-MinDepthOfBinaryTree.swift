import Foundation

public class Solution111 {
    public init() {}
    public func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return minDepth(root, 1)
    }
    private func minDepth(_ root: TreeNode, _ depth: Int) -> Int {
        if root.left == nil && root.right == nil { return depth }
        let depth = depth + 1
        let leftDepth = root.left.flatMap { minDepth($0, depth) } ?? Int.max
        let rightDepth = root.right.flatMap { minDepth($0, depth) } ?? Int.max
        return min(leftDepth, rightDepth)
    }
}

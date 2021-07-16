import Foundation

public class Solution543 {
    private var longestPath = 0
    public init() {}
    public func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        _ = longestPath(root)
        return longestPath
    }
    private func longestPath(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let left = longestPath(root.left)
        let right = longestPath(root.right)
        
        longestPath = max(longestPath, left + right)
        
        return max(left, right) + 1
    }
}

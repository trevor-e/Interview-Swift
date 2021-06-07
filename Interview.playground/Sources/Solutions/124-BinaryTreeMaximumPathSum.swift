import Foundation

public class Solution124 {
    private var maxSum = Int.min
    public init() {}
    public func maxPathSum(_ root: TreeNode?) -> Int {
        maxGain(root)
        return maxSum
    }
    private func maxGain(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        // Recursively calculate the gain of each subtree
        // Guard against negative value subtrees by comparing against 0
        let leftGain = max(maxGain(node.left), 0)
        let rightGain = max(maxGain(node.right), 0)
        
        // Test the current path against the current max
        let currentPathGain = node.val + leftGain + rightGain
        maxSum = max(maxSum, currentPathGain)
        
        // Recursion base case
        return node.val + max(leftGain, rightGain)
    }
}

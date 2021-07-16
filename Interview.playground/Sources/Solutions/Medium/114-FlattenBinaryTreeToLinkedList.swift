import Foundation

public class Solution114 {
    public init() {}
    public func flatten(_ root: TreeNode?) {
        var node = root
        var rightMost: TreeNode?
        while node != nil {
            if let left = node?.left {
                // Find the right-most node of the left subtree
                rightMost = left
                while rightMost?.right != nil {
                    rightMost = rightMost?.right
                }
                
                // Re-wire the nodes to insert the rightMost onto the right side of the tree
                rightMost?.right = node?.right
                node?.right = node?.left
                node?.left = nil
            }
            
            // Continue iterating on the right side
            node = node?.right
        }
    }
}

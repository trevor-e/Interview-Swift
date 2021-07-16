import Foundation

public class Solution236 {
    private var answer: TreeNode?
    public init() {}
    public func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        _ = hasPOrQ(root, p, q)
        return answer
    }
    private func hasPOrQ(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let root = root else { return false }
        
        // Test each side of the tree recursively
        let left = hasPOrQ(root.left, p, q)
        let right = hasPOrQ(root.right, p, q)
        
        // The current node can also be included in the test
        let mid = root.val == p?.val || root.val == q?.val
        
        // If two of the tests succeed then we've found the common ancestor
        if [left, right, mid].filter({ $0 }).count >= 2 {
            answer = root
        }
        
        return left || mid || right
    }
}

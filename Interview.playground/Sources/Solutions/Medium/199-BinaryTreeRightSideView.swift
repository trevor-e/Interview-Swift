import Foundation

/// This question is a bit confusing, they mean if you are physically standing on the right side
/// what nodes could you see in the tree? That means the right-most node of each level. We can use
/// a queue to store each level of the tree and then take the last element of each row.
public class Solution199 {
    public init() {}
    public func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var solution = [Int]()
        var queue = Queue<[TreeNode]>()
        queue.enqueue([root])
        
        while !queue.isEmpty {
            guard let row = queue.dequeue() else { continue }
            
            // Build the next row
            var nextRow = [TreeNode]()
            for node in row {
                if let left = node.left {
                    nextRow.append(left)
                }
                if let right = node.right {
                    nextRow.append(right)
                }
            }
            if !nextRow.isEmpty {
                queue.enqueue(nextRow)
            }
            
            if let last = row.last {
                solution.append(last.val)
            }
        }
        
        return solution
    }
}

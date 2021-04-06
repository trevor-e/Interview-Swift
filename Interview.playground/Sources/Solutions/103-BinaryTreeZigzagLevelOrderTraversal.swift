import Foundation

public class Solution103 {
    public init() {}
    public func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        // Use an array since each level can grow exponentially and we want to group each level
        var queue = Queue<[TreeNode]>()
        queue.enqueue([root])
        
        var results = [[Int]]()
        var shouldReverse = false
        while !queue.isEmpty {
            guard let currentLevel = queue.dequeue() else { break }
            var result = [Int]()
            var nextLevel = [TreeNode]()
            
            for node in currentLevel {
                result.append(node.val)
                if let lhs = node.left {
                    nextLevel.append(lhs)
                }
                if let rhs = node.right {
                    nextLevel.append(rhs)
                }
            }
            
            if !result.isEmpty {
                results.append(shouldReverse ? result.reversed() : result)
            }
            if !nextLevel.isEmpty {
                queue.enqueue(nextLevel)
            }
            shouldReverse.toggle()
        }
        return results
    }
}

import Foundation

public class Solution133 {
    private var visited = [Int: Node]()
    public init() {}
    public func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        
        // Cache visited nodes to prevent recursive searches since this is an undirected graph
        if let visitedNode = visited[node.val] {
            return visitedNode
        }
        
        let clonedNode = Node(node.val)
        visited[node.val] = clonedNode
        
        // Recursively build the node neighbors
        clonedNode.neighbors = node.neighbors.map { cloneGraph($0) }
        
        return clonedNode
    }
}

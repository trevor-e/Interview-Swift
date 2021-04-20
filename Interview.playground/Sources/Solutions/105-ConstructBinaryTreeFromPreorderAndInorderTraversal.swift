import Foundation

/// The preorder array gives us easy access to the root node.
/// The inorder array allows us to recursively split the tree into subtrees based on the
/// root node's position in the array.
public class Solution105 {
    public init() {}
    var pIndex = 0
    var indexes = [Int: Int]()
    public func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty && !inorder.isEmpty else { return nil }
        // Cache the position of each val in the inorder array
        for (offset, val) in inorder.enumerated() { indexes[val] = offset }
        return buildSubtree(preorder, 0, inorder.count - 1)
    }
    private func buildSubtree(_ preorder: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        guard start <= end else { return nil }
        
        // We know the root node is the current first preorder node
        let val =  preorder[pIndex]
        let index =  indexes[val]!
        let node = TreeNode(val)
        pIndex += 1
        
        node.left = buildSubtree(preorder, start, index - 1)
        node.right = buildSubtree(preorder, index + 1, end)
        return node
    }
}

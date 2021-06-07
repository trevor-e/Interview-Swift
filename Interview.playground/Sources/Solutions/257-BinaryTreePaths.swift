import Foundation

public class Solution257 {
    public init() {}
    public func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        let solution = String(root.val)
        if root.left == nil && root.right == nil {
            return [solution]
        }
        var solutions = [String]()
        recursePath(root.left, solution, &solutions)
        recursePath(root.right, solution, &solutions)
        return solutions
    }
    private func recursePath(_ root: TreeNode?, _ solution: String, _ solutions: inout [String]) {
        guard let root = root else {
            return
        }
        let solution = solution + "->\(root.val)"
        if root.left == nil && root.right == nil {
            solutions.append(solution)
        }
        recursePath(root.left, solution, &solutions)
        recursePath(root.right, solution, &solutions)
    }
}

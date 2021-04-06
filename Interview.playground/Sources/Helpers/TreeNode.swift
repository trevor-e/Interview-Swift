import Foundation

public class TreeNode: CustomStringConvertible {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init?(_ val: Int?) { guard let val = val else { return nil }; self.val = val }
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    public var description: String { String(val) }
    public func printTree() {
        left?.printTree()
        print(String(val))
        right?.printTree()
    }
//    public required init(arrayLiteral elements: Int...) {
//        var nodes = elements.map { TreeNode($0) }
//        for (offset, node) in nodes.enumerated() {
//
//        }
//    }
}

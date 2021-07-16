import Foundation

/// Since the array is sorted, we know all the left hand values are in the first half of the array
/// and the larger values in the right side. We can pick out the midpoint as the root node and then
/// recursively assign the left/right off those array slices.
public class Solution108 {
    public init() {}
    public func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else { return nil }
        let mid = nums.count / 2
        let root = TreeNode(nums[mid])
        root.left = sortedArrayToBST(Array(nums[0..<mid]))
        root.right = sortedArrayToBST(Array(nums[mid+1..<nums.count]))
        return root
    }
}

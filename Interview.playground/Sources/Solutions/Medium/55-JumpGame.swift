import Foundation

/// Start from the right and keep track of the first index that can jump to the end.
/// Then keep going and see which can jump to that and so on.
public class Solution55 {
    public init() {}
    public func canJump(_ nums: [Int]) -> Bool {
        var lastGoodIndex = nums.endIndex - 1
        var current = nums.endIndex - 2
        while current >= nums.startIndex {
            let value = nums[current]
            if current + value >= lastGoodIndex {
                lastGoodIndex = current
            }
            current = nums.index(before: current)
        }
        return lastGoodIndex == nums.startIndex
    }
}

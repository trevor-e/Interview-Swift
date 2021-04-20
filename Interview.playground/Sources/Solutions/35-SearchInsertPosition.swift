import Foundation

public class Solution35 {
    public init() {}
    public func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        var left = 0
        var right = nums.count - 1
        while left <= right {
            // Shortcut to calculating the mid since we aren't keeping a running calc
            let mid = left + ((right - left) / 2)
            let val = nums[mid]
            if val == target {
                return mid
            } else if val > target { // Val too big, search lower
                right = mid - 1
            } else { // Val too small, search higher
                left = mid + 1
            }
        }
        return left
    }
}

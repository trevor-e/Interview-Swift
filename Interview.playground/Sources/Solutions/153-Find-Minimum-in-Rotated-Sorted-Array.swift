import Foundation

/// Since the original array was sorted the smallest element should be the previous first element.
/// Now that it's shifted, we can take the left most element and binary search by the value
/// from the opposite side.
public class Solution153 {
    public init() {}
    public func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        var min = Swift.min(nums[left], nums[right])
        while left <= right {
            let mid = left + ((right - left) / 2)
            let num = nums[mid]
            if num > min {
                left = mid + 1
            } else {
                right = mid - 1
            }
            min = Swift.min(min, num)
        }
        return min
    }
}

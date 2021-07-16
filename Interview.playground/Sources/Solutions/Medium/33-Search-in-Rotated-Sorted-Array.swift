import Foundation

/// Use a binary search to find the pivot point. Then create two subarrays and binary search each of them.
public class Solution33 {
    public init() {}
    public func search(_ nums: [Int], _ target: Int) -> Int {
        let minIndex = findMinIndex(nums)
        let left = Array(nums[0..<minIndex])
        let right = Array(nums[minIndex..<nums.endIndex])
        return binarySearch(left, target: target)
            ?? binarySearch(right, target: target).flatMap { $0 + left.count }
            ?? -1
    }
    private func binarySearch(_ nums: [Int], target: Int) -> Int? {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + ((right - left) / 2)
            let num = nums[mid]
            if num == target { return mid }
            else if num > target { right = mid - 1 }
            else { left = mid + 1 }
        }
        return nil
    }
    private func findMinIndex(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        var minIndex: Int!
        var min: Int!
        if nums[left] < nums[right] {
            min = nums[left]
            minIndex = left
        } else {
            min = nums[right]
            minIndex = right
        }
        while left <= right {
            let mid = left + ((right - left) / 2)
            let num = nums[mid]
            if num > min {
                left = mid + 1
            } else {
                right = mid - 1
            }
            if num < min {
                min = num
                minIndex = mid
            }
        }
        return minIndex
    }
}

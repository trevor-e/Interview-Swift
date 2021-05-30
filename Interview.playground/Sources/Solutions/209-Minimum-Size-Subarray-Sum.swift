import Foundation

/// This is another sliding window problem.
public class Solution209 {
    public init() {}
    public func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var leftIndex = 0
        guard nums[0] < target else { return 1 }
        guard nums.count > 1 else { return nums[leftIndex] >= target ? 1 : 0 }
        var rightIndex = 1
        var sum = nums[leftIndex] + nums[rightIndex]
        var smallestLength = Int.max
        
        while leftIndex <= rightIndex, rightIndex < nums.endIndex {
            if sum >= target {
                smallestLength = min(smallestLength, rightIndex - leftIndex + 1)
                sum -= nums[leftIndex]
                leftIndex = nums.index(after: leftIndex)
            } else {
                if rightIndex + 1 == nums.endIndex {
                    break
                }
                rightIndex = nums.index(after: rightIndex)
                sum += nums[rightIndex]
            }
        }
        
        return smallestLength == Int.max ? 0 : smallestLength
    }
}

import Foundation

public class Solution283 {
    public init() {}
    public func moveZeroes(_ nums: inout [Int]) {
        // This is kind of like a sliding window
        // Keep track of how many zeroes we have stuck together
        // When we find a non-zero, swap with the first 0 of the group
        var consecutiveZeroes = 0
        for i in 0..<nums.count {
            if nums[i] == 0 {
                consecutiveZeroes += 1
            } else if consecutiveZeroes > 0 {
                nums.swapAt(i, i - consecutiveZeroes)
            }
        }
    }
}

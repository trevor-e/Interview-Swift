import Foundation

public class Solution26 {
    public init() {}
    public func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        guard nums.count > 1 else { return 1 }
        var index = 1
        for i in 1..<nums.count {
            if nums[i] != nums[i - 1] {
                nums[index] = nums[i]
                index += 1
            }
        }
        return index
    }
}

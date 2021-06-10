import Foundation

public class Solution27 {
    public init() {}
    public func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = nums.startIndex
        for num in nums {
            if num != val {
                nums[i] = num
                i += 1
            }
        }
        return i
    }
}

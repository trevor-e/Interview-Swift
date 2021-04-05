import Foundation

public class Solution1 {
    public init() {}
    public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (offset, num) in nums.enumerated() {
            let find = target - num
            if let findOffset = dict[find] {
                return [offset, findOffset]
            }
            dict[num] = offset
        }
        return []
    }
}

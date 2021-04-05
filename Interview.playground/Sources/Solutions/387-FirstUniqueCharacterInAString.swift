import Foundation

public class Solution387 {
    public init() {}
    public func firstUniqChar(_ s: String) -> Int {
        var charCounts = [Character: Int]()
        for char in s {
            charCounts[char, default: 0] += 1
        }
        for (offset, char) in s.enumerated() {
            if charCounts[char] == 1 {
                return offset
            }
        }
        return -1
    }
}

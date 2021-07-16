import Foundation

public class Solution3 {
    public init() {}
    public func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        guard s.count > 1 else { return 1 }
        var set = Set<Character>()
        var left = s.startIndex
        set.insert(s[left])
        var maxCount = 1
        var right = s.index(after: s.startIndex)
        while right < s.endIndex {
            if set.contains(s[right]) {
                set.remove(s[left])
                left = s.index(after: left)
            } else {
                set.insert(s[right])
                maxCount = max(maxCount, set.count)
                right = s.index(after: right)
            }
        }
        return maxCount
    }
}

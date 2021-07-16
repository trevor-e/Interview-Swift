import Foundation

// Top 100% :D
public class Solution392 {
    public init() {}
    public func isSubsequence(_ sub: String, _ string: String) -> Bool {
        guard !sub.isEmpty else { return true }
        guard !string.isEmpty else { return false }
        var subIndex = sub.startIndex
        for char in string {
            if char == sub[subIndex] {
                subIndex = sub.index(after: subIndex)
                if subIndex == sub.endIndex {
                    return true
                }
            }
        }
        return false
    }
}

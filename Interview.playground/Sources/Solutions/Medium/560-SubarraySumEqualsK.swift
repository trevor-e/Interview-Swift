import Foundation

/// Store the "prefixes" of earlier subarray calculations (cumulative sum).
/// If we know the prefixes, then pref(B) - pref(A) = sum A..B
public class Solution560 {
    public init() {}
    public func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var solutions = 0
        // Edge case: initialize with this to avoid case where sum - k = 0
        // Technically we've already seen sum = 0 as the base case for an empty array
        var prefixes = [0 : 1]
        var sum = 0
        for num in nums {
            sum += num
            // Searching for "sum - k" tells us if we've calculated a running sum that
            // would add up to our target "k". Since the same subarray can be used
            if let previous = prefixes[sum - k] {
                solutions += previous
            }
            prefixes[sum, default: 0] += 1
        }
        return solutions
    }
}

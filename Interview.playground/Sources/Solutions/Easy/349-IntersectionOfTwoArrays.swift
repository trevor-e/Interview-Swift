import Foundation

/// Use a dictionary to store the arrays, with the key being the *sorted* word.
public class Solution349 {
    public init() {}
    public func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let set1 = Set(nums1)
        let set2 = Set(nums2)
        let intersection = set1.intersection(set2)
        return Array(intersection)
    }
}

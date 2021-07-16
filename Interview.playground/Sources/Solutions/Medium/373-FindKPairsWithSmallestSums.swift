import Foundation

// Arrays are sorted smallest -> largest
// Heap solution: create all pairs iterating from the start of each array, insert into Heap
// Remove heap items until reach K
public class Solution373 {
    public init() {}
    public func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var heap = Heap<(Int, Int)>(sort: { lhs, rhs in (lhs.0 + lhs.1) > (rhs.0 + rhs.1) })
        
        // Initialize with all pairs
        for num1 in nums1 {
            for num2 in nums2 {
                heap.insert((num1, num2))
            }
        }
        
        // Remove the highest pairs until reaching K
        while heap.count > k {
            heap.remove()
        }
        
        // Accum the result
        var results = [[Int]]()
        while !heap.isEmpty {
            if let value = heap.remove() {
                results.append([value.0, value.1])
            }
        }
        
        return results
    }
}

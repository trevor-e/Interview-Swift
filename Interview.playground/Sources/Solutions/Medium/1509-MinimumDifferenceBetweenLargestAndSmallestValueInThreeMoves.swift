import Foundation

public class Solution1509 {
    public init() {}
    public func minDifference(_ nums: [Int]) -> Int {
        guard nums.count > 4 else { return 0 }
        
        let sorted = nums.sorted()
        let count = sorted.count
        
        // We have four cases to check:
        // 1. Knock off first 3
        // 2. Knock off first 2, last 1
        // 3. Knock off first 1, last 2
        // 4. Knock off last 3
        // Can be generalized as a sliding window, but in this case it's faster to check manually
        
        // 1.
        var smallest = sorted[count - 1] - sorted[3]
        
        // 2.
        smallest = min(smallest, sorted[count - 1 - 1] - sorted[2])
        
        // 3.
        smallest = min(smallest, sorted[count - 1 - 2] - sorted[1])
        
        // 4.
        smallest = min(smallest, sorted[count - 1 - 3] - sorted[0])
        
        return smallest
    }
}

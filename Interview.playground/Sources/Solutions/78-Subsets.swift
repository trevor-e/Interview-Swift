import Foundation

public class Solution78 {
    public init() {}
    public func subsets(_ nums: [Int]) -> [[Int]] {
        // Start with an empty array,
        var result: [[Int]] = [[]]
        
        // Start from each num to create a subsequence
        for num in nums {
            
            // Append the next number to all current solutions
            for i in 0..<result.count {
                result.append(result[i] + [num])
            }
        }
        
        return result
    }
}

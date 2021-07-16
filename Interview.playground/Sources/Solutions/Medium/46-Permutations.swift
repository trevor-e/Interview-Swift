import Foundation

/// Use Heap's Algorithm to generate permuations.
public class Solution46 {
    public init() {}
    public func permute(_ nums: [Int]) -> [[Int]] {
        guard !nums.isEmpty else { return [] }
        var solution = [[Int]]()
        permute(array: nums, startIndex: 0, solution: &solution)
        return solution
    }
    private func permute(array: [Int], startIndex: Int, solution: inout [[Int]]) {
        // If startIndex == array count then we've reached the end
        guard startIndex < array.count else {
            solution.append(array)
            return
        }
        
        var array = array
        
        // Start from startIndex since we know everything before that was already permutated
        for i in startIndex..<array.count {
            array.swapAt(startIndex, i)
            permute(array: array, startIndex: startIndex + 1, solution: &solution)
        }
    }
}

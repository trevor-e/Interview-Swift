import Foundation

/// Find the max single weight as our minimum
/// Calculate the sum of weights as our maximum
/// Perform a binary search of the weight with our min/max bounds to find the optimal
/// From each position, calculate the number of ships needed to that point
/// If we find a match that is <= D, we have to coninue searching in case we find a better solution.
public class Solution1011 {
    public init() {}
    public func shipWithinDays(_ weights: [Int], _ D: Int) -> Int {
        // Note: we are binary searching the *weight* and not the weights array, so these
        // indexes shouldn't be used for lookups
        var left = weights.max()!
        var right = weights.reduce(0, +)
        while left <= right {
            let mid = (left + right) / 2
            var shipCount = 1
            var shipCapacity = 0
            // Check how many ships would be needed for the midpoint
            for weight in weights {
                shipCapacity += weight
                if shipCapacity > mid {
                    shipCount += 1
                    shipCapacity = weight
                }
            }
            
            // If we took too many days then we need to increase the ship capacity
            if shipCount > D { left = mid + 1 }
            // If we found a solution, keep checking for more optimal solutions
            else { right = mid - 1 }
        }
        return left
    }
}

import Foundation

/// Here the abs(x_i - x_j) is a distraction for you, since x_i < x_j we can arrange it as x_j - x_i and remove the abs().
/// Then, we can rearrange the equation to be y_i - x_i + y_j + x_j.
/// We want to use a sliding window of size k and then maximize part of the equation for this range.
public class Solution1499 {
    public init() {}
    public func findMaxValueOfEquation(_ points: [[Int]], _ k: Int) -> Int {
        var deque = Deque<(Int, Int)>() // A deque of point indexes
        var result = Int.min
        
        for point in points {
            // Each point through is our "j" so we need to find the maximal "i"
            let xj = point.x
            let yj = point.y
            
            // Remove old values that are now outside of the window range
            while !deque.isEmpty && deque.peekFirst()!.0 + k < xj {
                deque.removeFirst()
            }
            
            // Take our current maximum (monotonic queue so the first value) and test if it's the max
            if !deque.isEmpty {
                let i = deque.peekFirst()!
                let xi = i.0
                let yi = i.1
                result = max(result, xj + yj - xi + yi)
            }
            
            // Maintain our monotonic queue by removing points at the end having a smaller sum than our current point
            while !deque.isEmpty {
                let i = deque.peekLast()!
                let xi = i.0
                let yi = i.1
                if yi - xi <= yj - xj {
                    deque.removeLast()
                } else {
                    break
                }
            }
            
            // Process the current index which works because the points are sorted by X
            deque.append((xj, yj))
        }
        
        return result
    }
}

// [ [0,0] , [3,0] , [9,2] ]
// Deque: [0]
// Max: 3

private extension Array where Element == Int {
    var x: Int { self[0] }
    var y: Int { self[1] }
}

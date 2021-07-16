import Foundation

/// Start with a pointer on each end and move in the side that has the shorter height.
public class Solution11 {
    public init() {}
    public func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var left = height.startIndex
        var right = height.endIndex - 1
        while left < right {
            let area = min(height[left], height[right]) * (right - left)
            maxArea = max(maxArea, area)
            if height[left] < height[right] {
                left = height.index(after: left)
            } else {
                right = height.index(before: right)
            }
        }
        return maxArea
    }
}

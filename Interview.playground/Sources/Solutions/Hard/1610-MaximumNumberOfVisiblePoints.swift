import Foundation

public class Solution1610 {
    public init() {}
    public func visiblePoints(_ points: [[Int]], _ angle: Int, _ location: [Int]) -> Int {
        var sameLocationCount = 0
        var pointAngles = [Double]()
        for point in points {
            let dx = point.x - location.x
            let dy = point.y - location.y
            // If the point is the same as the location we can always increment the solution
            if dx == 0 && dy == 0 {
                sameLocationCount += 1
            } else {
                // Compute the atan2 of our point relative to the location
                // This gives us the theta of the x-axis to our point
                // Intuitively this makes sense, and maybe the interviewer will give you a hint, otherwise
                // it seems like you could stub the function out
                let angle = atan2(Double(dy), Double(dx)) // given in radians
                let degrees = rad2deg(angle)
                pointAngles.append(degrees)
            }
        }
        
        // Sort the angles so we can compute a sliding window
        pointAngles.sort()
        
        // Add the 360 complement of each angle to help us compute points that loop around our start
        // This is a "gotcha" that makes sense once you draw the problem out
        for index in 0..<pointAngles.count {
            pointAngles.append(pointAngles[index] + 360)
        }
        
        // Use a sliding window to find the maximum range that is <= angle
        var left = 0
        var right = 0
        var maxWindow = 0
        let angle = Double(angle)
        while right < pointAngles.count {
            if (pointAngles[right] - pointAngles[left]) > angle {
                left += 1
            }
            maxWindow = max(maxWindow, right - left + 1)
            right += 1
        }
        
        // And then return that window size + the points that are the same as the start
        return maxWindow + sameLocationCount
    }
    private func rad2deg(_ number: Double) -> Double { number * 180 / .pi }
}
private extension Array where Element == Int {
    var x: Int { self[0] }
    var y: Int { self[1] }
}

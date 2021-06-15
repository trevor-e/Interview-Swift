import Foundation

/// Sum up the first K values.
/// Then pop one off the last "front" part and add to the back
/// Continue until you've checked K size on both ends
/// Basically a form of sliding window
public class Solution1423 {
    public init() {}
    public func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        var frontScore = cardPoints.prefix(k).reduce(0, +)
        var rearScore = 0
        var maxScore = frontScore
        
        if k == cardPoints.count { return frontScore }
        
        var k = k - 1
        var frontIndex = cardPoints.startIndex.advanced(by: k)
        var endIndex = cardPoints.endIndex - 1
        while k >= 0 {
            frontScore -= cardPoints[frontIndex]
            rearScore += cardPoints[endIndex]
            maxScore = max(maxScore, rearScore + frontScore)
            frontIndex = cardPoints.index(before: frontIndex)
            endIndex = cardPoints.index(before: endIndex)
            k -= 1
        }
        
        return maxScore
    }
}

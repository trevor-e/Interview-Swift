import Foundation

public class Solution66 {
    public init() {}
    public func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var currentIndex = digits.endIndex - 1
        digits[currentIndex] += 1
        var carryOver = 0
        while currentIndex >= digits.startIndex {
            if carryOver > 0 {
                digits[currentIndex] += carryOver
                carryOver = 0
            }
            if digits[currentIndex] == 10 {
                digits[currentIndex] = 0
                carryOver = 1
            } else {
                break
            }
            currentIndex = digits.index(before: currentIndex)
        }
        if carryOver > 0 {
            digits.insert(carryOver, at: 0)
        }
        return digits
    }
}

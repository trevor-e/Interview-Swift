import Foundation

/// Use a dictionary to store the arrays, with the key being the *sorted* word.
public class Solution49 {
    public init() {}
    public func groupAnagrams(_ strs: [String]) -> [[String]] {
        var solutions = [String: [String]]()
        for str in strs {
            let sorted = String(str.sorted())
            var array = solutions[sorted, default: []]
            array.append(str)
            solutions[sorted] = array
        }
        return Array(solutions.values)
    }
}

import Foundation

public class Solution953 {
    public init() {}
    public func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        guard words.count > 1 else { return true }
        var indexes = [Character: Int]()
        for (offset, char) in order.enumerated() { indexes[char] = offset }
        
        for i in 1..<words.count {
            let first = words[i-1]
            let second = words[i]
            if !isFirstWordSmaller(first, second, indexes) {
                return false
            }
        }
        
        return true
    }
    private func isFirstWordSmaller(_ first: String, _ second: String, _ indexes: [Character: Int]) -> Bool {
        for (char1, char2) in zip(first, second) {
            guard let index1 = indexes[char1], let index2 = indexes[char2] else {
                continue
            }
            if index1 < index2 {
//                print("\(char1) \(index1) is smaller than \(char2) \(index2)")
                return true
            } else if index1 > index2 {
//                print("\(char1) \(index1) is bigger than \(char2) \(index2)")
                return false
            }
        }
//        print("both have the same prefix: \(second.count) \(first.count)")
        return first.count <= second.count
    }
}

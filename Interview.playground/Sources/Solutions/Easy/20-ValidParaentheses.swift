import Foundation

public class Solution20 {
    public init() {}
    public func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let closeOpen: [Character: Character] = [")": "(", "]": "[", "}": "{"]
        for char in s {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            } else {
                // Stack has to have elements to have a match
                guard !stack.isEmpty else { return false }
                // The most recent stack char should match our mapping for the current char
                guard stack.removeLast() == closeOpen[char] else { return false }
            }
        }
        // If there's still elements then there are opens without closes
        return stack.isEmpty
    }
}

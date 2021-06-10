import Foundation

public class Solution1249 {
    public init() {}
    public func minRemoveToMakeValid(_ s: String) -> String {
        // Keep track of the balance of parens. We can skip any ")" if our balance if 0 because it doesn't
        // have a matching opening. The open brackets are trickier. If we have a positive balance at the end
        // then we have open parens left to remove. To fix this, we can remove open parens from the end
        // by calculating how many to skip at the beginning.
        var newString = ""
        var balance = 0
        var openCount = 0
        for char in s {
            if char == ")" && balance == 0 {
                continue
            }
            if char == "(" {
                balance += 1
                openCount += 1
            } else if char == ")" {
                balance -= 1
            }
            newString.append(char)
        }
        
        var openToSkip = openCount - balance
        var finalString = ""
        for char in newString {
            if char == "(" {
                if openToSkip == 0 {
                    continue
                } else {
                    openToSkip -= 1
                }
            }
            finalString.append(char)
        }
        
        return finalString
    }
}

import Foundation

public class Solution929 {
    public init() {}
    public func numUniqueEmails(_ emails: [String]) -> Int {
        var result = Set<String>()
        for email in emails {
            var string = ""
            var inLocal = true
            var skipLocal = false
            for char in email {
                if char == "." && inLocal {
                    continue
                } else if char == "+" && inLocal {
                    skipLocal = true
                } else if char == "@" {
                    inLocal = false
                }
                
                if (inLocal && !skipLocal) || !inLocal {
                    string.append(char)
                }
            }
            result.insert(string)
        }
        return result.count
    }
}

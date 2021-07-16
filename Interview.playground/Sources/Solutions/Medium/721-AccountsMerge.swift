import Foundation

public class Solution721 {
    public init() {}
    public func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        // If there's a common email between names then we want to merge those together
        //
        // Build a graph of all emails for a name
        // Also store a map of email -> name for building the solution
        // For each email in our graph:
        //   - If we visited it before, do a DFS of all neighbors of that email (previously built)
        //   - Store all the unvisited neighbors as a result for that email
        var emailToName = [String: String]()
        var emailNeighbors = [String: Set<String>]()
        
        for account in accounts {
            let name = account[0]
            
            // Create a graph of the first email connected to every other email in the list
            for email in account.dropFirst() {
                emailToName[email] = name
                
                let firstEmail = account[1]
                emailNeighbors[firstEmail, default: Set()].insert(email)
                emailNeighbors[email, default: Set()].insert(firstEmail)
            }
        }
        
        var visitedEmails = Set<String>()
        var solutions = [[String]]()
        
        for email in emailNeighbors.keys {
            if !visitedEmails.contains(email) {
                visitedEmails.insert(email)
                
                var dfsStack = [email]
                var solution = [String]()
                while !dfsStack.isEmpty {
                    guard let email = dfsStack.popLast() else { continue }
                    
                    solution.append(email)
                    
                    for neighbor in emailNeighbors[email, default: Set()] {
                        if !visitedEmails.contains(neighbor) {
                            visitedEmails.insert(neighbor)
                            dfsStack.append(neighbor)
                        }
                    }
                }
                
                solutions.append([emailToName[email]!] + solution.sorted())
            }
        }
        
        return solutions
    }
}

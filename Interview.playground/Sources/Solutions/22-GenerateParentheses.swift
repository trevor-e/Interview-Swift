import Foundation

public class Solution22 {
    public init() {}
    public func generateParenthesis(_ n: Int) -> [String] {
        var solutions = [String]()
        helper(string: "", solutions: &solutions, leftRemaining: n, rightRemaining: n)
        return solutions
    }
    private func helper(string: String, solutions: inout [String], leftRemaining: Int, rightRemaining: Int) {
        // If we ever have more rightRemaining then the parentheses won't be balanced
        // So we can backtrack at this pointnba
        if rightRemaining < leftRemaining {
            return
        }
        if leftRemaining == 0 && rightRemaining == 0 {
            solutions.append(string)
            return
        }
        if leftRemaining > 0 {
            helper(string: string + "(", solutions: &solutions, leftRemaining: leftRemaining - 1, rightRemaining: rightRemaining)
        }
        if rightRemaining > 0 {
            helper(string: string + ")", solutions: &solutions, leftRemaining: leftRemaining, rightRemaining: rightRemaining - 1)
        }
    }
}

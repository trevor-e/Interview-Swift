import Foundation

/// Draw it out as a binary tree and the patterns will become more obvious, each row
/// is repeating and shifted from the previous row. Also, if you split the row in half, each side
/// is the complement of the other. Knowing this, we can compute the midpoint to know if K is on
/// the left or right side of the row. If it's on the right side, we can subtract the midpoint value
/// and take the complement to recursively find the solution. On the left side we can simply take
/// the recursive solution.
public class Solution779 {
    public init() {}
    public func kthGrammar(_ N: Int, _ K: Int) -> Int {
        if N == 1 { return 0 }
        let midpoint = Int(truncating: pow(2, N - 2) as NSDecimalNumber)
        if K <= midpoint {
            return kthGrammar(N - 1, K)
        } else {
            return kthGrammar(N - 1, K - midpoint) == 0 ? 1 : 0
        }
    }
}

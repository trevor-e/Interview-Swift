import Foundation

/// 2^0 = 1
/// 2^1 = 2
/// 2^-2 = 1/(2*2) = 1/4
public class Solution50 {
    public init() {}
    public func myPow(_ x: Double, _ n: Int) -> Double {
        // If it's negative then take the inverse to make this simpler
        if n < 0 { return myPow(1/x, abs(n)) }
        // Our base case
        guard n != 0 else { return 1 }
        // x^4 = x^2 * x^2
        // x^5 = x^2 * x^2 * x^1
        // We can split this based on even/odd and actually makes this O(log n) runtime
        let lower = myPow(x, n/2)
        let combined = lower * lower
        return n % 2 == 0 ? combined : combined * x
    }
}

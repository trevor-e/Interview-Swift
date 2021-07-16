import Foundation

public class Solution39 {
    public init() {}
    public func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sortedCandidates = candidates.sorted()
        var solution = [[Int]]()
        dfs(candidates: sortedCandidates, solution: &solution, current: [], remainder: target, start: 0)
        return solution
    }
    private func dfs(candidates: [Int], solution: inout [[Int]], current: [Int], remainder: Int, start: Int) {
        guard remainder >= 0 else { return }
        if remainder == 0 {
            solution.append(current)
            return
        }
        
        // Since the array is sorted we only need to DFS ahead of our current position and are guaranteed
        // no duplicate solutions this way.
        for i in start..<candidates.count {
            let val = candidates[i]
            let current = current + [val]
            dfs(candidates: candidates, solution: &solution, current: current, remainder: remainder - val, start: i)
        }
    }
}

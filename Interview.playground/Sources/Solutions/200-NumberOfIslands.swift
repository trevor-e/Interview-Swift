import Foundation

public class Solution200 {
    public init() {}
    public func numIslands(_ grid: [[Character]]) -> Int {
        var visitedTiles = grid
        var solutions = 0
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if visitedTiles[i][j] == "1" {
                    solutions += 1
                    markTile(i, j, in: &visitedTiles)
                }
            }
        }
        return solutions
    }
    private func markTile(_ i: Int, _ j: Int, in grid: inout [[Character]]) {
        guard i >= 0, i < grid.count, j >= 0, j < grid[i].count, grid[i][j] == "1" else { return }
        grid[i][j] = "0"
        markTile(i + 1, j, in: &grid)
        markTile(i - 1, j, in: &grid)
        markTile(i, j + 1, in: &grid)
        markTile(i, j - 1, in: &grid)
    }
}

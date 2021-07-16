import Foundation

/// Similar to SLN200, use BFS to discover each island and stop the search when reaching an
/// edge or a water tile. Initialize the BFS from each starting tile, and keep track of visited
/// tiles in a separate grid. The difference is we keep track of the current island we are on
/// and use a hashmap to increment the island size when visiting tiles.
public class Solution695 {
    public init() {}
    public func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var currentIsland = 0
        var islandSizes = [Int: Int]()
        var visitedTiles = grid
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if visitedTiles[i][j] == 1 {
                    currentIsland += 1
                    markTile(i, j, currentIsland: currentIsland, islandSizes: &islandSizes, grid: &visitedTiles)
                }
            }
        }
        
        return islandSizes.values.max() ?? 0
    }
    private func markTile(_ i: Int, _ j: Int, currentIsland: Int, islandSizes: inout [Int: Int], grid: inout [[Int]]) {
        guard i >= 0, i < grid.count, j >= 0, j < grid[i].count, grid[i][j] == 1 else { return }
        grid[i][j] = 0
        islandSizes[currentIsland, default: 0] += 1
        markTile(i + 1, j, currentIsland: currentIsland, islandSizes: &islandSizes, grid: &grid)
        markTile(i - 1, j, currentIsland: currentIsland, islandSizes: &islandSizes, grid: &grid)
        markTile(i, j + 1, currentIsland: currentIsland, islandSizes: &islandSizes, grid: &grid)
        markTile(i, j - 1, currentIsland: currentIsland, islandSizes: &islandSizes, grid: &grid)
    }
}

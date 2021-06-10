import Foundation

public protocol BinaryMatrix {
    func get(_ row: Int, _ col: Int) -> Int
    func dimensions() -> [Int]
}
public struct TestMatrix: BinaryMatrix {
    let matrix = [
        [1,1,1,1,1],
        [0,0,0,1,1],
        [0,0,1,1,1],
        [0,0,0,0,1],
        [0,0,0,0,0]
    ]
    public init() {}
    public func get(_ row: Int, _ col: Int) -> Int { matrix[row][col] }
    public func dimensions() -> [Int] { [matrix.count, matrix[0].count] }
}

public class Solution1428 {
    public init() {}
    public func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
        // 1. Find first row ending with a 1
        // 2. Binary search that row to find the 1 position
        // 3. Perform searching algo:
        // - If a 0 move south
        // - If a 1 move west
        // - Repeat until boundary
        let dimensions = binaryMatrix.dimensions()
        let rows = dimensions[0]
        let columns = dimensions[1]
        
        var rightIndex = columns - 1
        var currentRow = 0
        var foundOne = false
        
        // 1
        for row in 0..<rows {
            if binaryMatrix.get(row, rightIndex) == 1 {
                currentRow = row
                foundOne = true
                break
            }
        }
        
        if !foundOne {
            return -1
        }
        
        // 2
        var leftmost = binarySearch(binaryMatrix, currentRow, right: rightIndex)
        currentRow += 1
        rightIndex -= 1
        
        // 3
        while rightIndex >= 0 && currentRow <= rows - 1 {
            let val = binaryMatrix.get(currentRow, rightIndex)
            if val == 0 {
                currentRow += 1
            } else {
                leftmost = min(leftmost, rightIndex)
                rightIndex -= 1
            }
        }
        
        return leftmost
    }
    private func binarySearch(_ binaryMatrix: BinaryMatrix, _ row: Int, right: Int) -> Int {
        var left = 0
        var right = right
        while left < right {
            let mid = (left + right) / 2
            if binaryMatrix.get(row, mid) == 1 {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}

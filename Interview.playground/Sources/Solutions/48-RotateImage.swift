import Foundation

public class Solution48 {
    public init() {}
    public func rotate(_ matrix: inout [[Int]]) {
        transpose(&matrix)
        reflect(&matrix)
    }
    private func transpose(_ matrix: inout [[Int]]) {
        for i in 0..<matrix.count {
            for j in i+1..<matrix[i].count {
                let t = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = t
            }
        }
    }
    private func reflect(_ matrix: inout [[Int]]) {
        for i in 0..<matrix.count {
            matrix[i].reverse()
        }
    }
}

import Foundation

public class Solution347 {
    public init() {}
    public func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequencies = [Int: Int]()
        for num in nums {
            let freq = frequencies[num, default: 0] + 1
            frequencies[num] = freq
        }
        var heap = Heap<(Int, Int)>(array: Array(frequencies), sort: { $0.1 < $1.1 })
        while heap.count > k {
            heap.remove()
        }
        var results = [Int]()
        while !heap.isEmpty {
            if let value = heap.remove()?.0 {
                results.append(value)
            }
        }
        return results
    }
}

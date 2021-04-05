import Foundation

public class KthLargest703 {
    
    private let k: Int
    private var heap: Heap<Int>

    public init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.heap = Heap(array: nums, sort: <)
    }
    
    public func add(_ val: Int) -> Int {
        heap.insert(val)
        
        // Since we are comparing by "<", we can pop off elements until the size == K
        // Then we know the top element will be what we want.
        while heap.count > k {
            _ = heap.remove()
        }
        
        return heap.peek() ?? 0
    }
}

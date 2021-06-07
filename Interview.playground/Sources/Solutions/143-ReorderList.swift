import Foundation

public class Solution143 {
    public init() {}
    public func reorderList(_ head: ListNode?) {
        // 1. Find the middle of the list using slow/fast pointers
        // 2. Reverse the second half of the list
        // 3. Merge the two together
        // Alternatively, use a deque and alternate popping from the front/back, but not as space efficient
        guard let head = head else { return }
        
        let middle = findMiddle(head)
        
        var firstHalf: ListNode? = head.next
        let takeFirstHalf: () -> ListNode? = {
            let temp = firstHalf
            firstHalf = firstHalf?.next
            return temp
        }
        
        var secondHalf = reverse(middle)
        let takeSecondHalf: () -> ListNode? = {
            let temp = secondHalf
            secondHalf = secondHalf?.next
            return temp
        }
        
        var temp: ListNode? = head
        var takeSecond = true
        while temp != nil {
            if takeSecond {
                temp?.next = takeSecondHalf()
            } else {
                temp?.next = takeFirstHalf()
            }
            temp = temp?.next
            takeSecond.toggle()
        }
    }
    private func findMiddle(_ head: ListNode) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    private func reverse(_ head: ListNode?) -> ListNode? {
        var previous: ListNode? = nil
        var current = head
        while current != nil {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        return previous
    }
}

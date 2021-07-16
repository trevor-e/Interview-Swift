import Foundation

public class Solution2 {
    public init() {}
    public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var sum = (l1?.val ?? 0) + (l2?.val ?? 0)
        var digit = sum % 10
        var carryOver = sum >= 10 ? 1 : 0
        let node = ListNode(digit)
        var current: ListNode? = node
        l1 = l1?.next
        l2 = l2?.next
        
        while l1 != nil || l2 != nil {
            sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carryOver
            digit = sum % 10
            carryOver = sum >= 10 ? 1 : 0
            current?.next = ListNode(digit)
            current = current?.next
            l1 = l1?.next
            l2 = l2?.next
        }
        
        if carryOver > 0 {
            current?.next = ListNode(carryOver)
        }
        
        return node
    }
}

import Foundation

public class Solution21 {
    public init() {}
    public func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        let takeFirst: () -> ListNode? = {
            let temp = l1
            l1 = l1?.next
            return temp
        }
        let takeSecond: () -> ListNode? = {
            let temp = l2
            l2 = l2?.next
            return temp
        }
        let takeSmallest: () -> ListNode? = {
            guard let l1 = l1 else { return takeSecond() }
            guard let l2 = l2 else { return takeFirst() }
            return l1.val <= l2.val ? takeFirst() : takeSecond()
        }
        let first: ListNode? = takeSmallest()
        var next: ListNode? = takeSmallest()
        first?.next = next
        while l1 != nil || l2 != nil {
            let temp = takeSmallest()
            next?.next = temp
            next = next?.next
        }
        return first
    }
}

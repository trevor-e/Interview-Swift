import Foundation

public class Solution83 {
    public init() {}
    public func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        while current != nil {
            var next = current?.next
            while current?.val == next?.val {
                next = next?.next
            }
            current?.next = next
            current = current?.next
        }
        return head
    }
}

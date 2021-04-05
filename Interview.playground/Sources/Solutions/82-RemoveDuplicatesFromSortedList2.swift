import Foundation

public class Solution82 {
    public init() {}
    public func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var head = head
        if head == nil { return nil }
        
        // Shift head if it starts with the same vals
        while true {
            if head?.val == head?.next?.val, head?.next != nil {
                let prev = head
                head = head?.next
                while head?.val == prev?.val {
                    head = head?.next
                }
            } else {
                break
            }
        }
        
        // Start with a unique number now
        var current = head
        
        while current != nil {
            // Find the next value after the shift stops equalling the current's next
            if current?.next?.val == current?.next?.next?.val && current?.next != nil {
                var shift = current?.next
                while shift?.val == current?.next?.val {
                    shift = shift?.next
                }
                current?.next = shift
            } else {
                current = current?.next
            }
        }
        
        return head
    }
}

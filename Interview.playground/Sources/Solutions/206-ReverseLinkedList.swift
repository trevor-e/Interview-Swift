import Foundation

public class Solution206 {
    public init() {}
    public func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        
        var current = head
        var next = head?.next
        
        // Since this is the new tail we need to clear out the next
        current?.next = nil
        
        while next != nil {
            let temp = next?.next
            next?.next = current
            current = next
            next = temp
        }
        
        return current
    }
}

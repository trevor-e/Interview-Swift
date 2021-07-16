import Foundation

public class Solution142 {
    public init() {}
    public func detectCycle(_ head: ListNode?) -> ListNode? {
        guard let head = head, head.next != nil else { return nil }
        
        var slow: ListNode? = head
        var fast: ListNode? = head
            
        while slow?.next != nil || fast?.next != nil || fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                break
            }
        }
            
        slow = head
        while fast !== slow {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
    }
}

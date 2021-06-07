import Foundation

public class Solution138 {
    public init() {}
    public func copyRandomList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        let newList = ListNode(head.val)
        var mapping = [ObjectIdentifier(head): newList]
        
        // Build the initial new list
        var current: ListNode? = newList
        var temp = head.next
        while temp != nil {
            guard let _temp = temp else { continue }
            
            // Cache the lookup of old -> new node
            let newNode = ListNode(_temp.val)
            mapping[ObjectIdentifier(_temp)] = newNode
            current?.next = newNode
            
            current = newNode
            temp = temp?.next
        }
        
        // Now loop through and assign the old randoms to the new mapping
        temp = head
        var newListTemp: ListNode? = newList
        while temp != nil {
            if let random = temp?.random {
                newListTemp?.random = mapping[ObjectIdentifier(random)]
            }
            temp = temp?.next
            newListTemp = newListTemp?.next
        }
        
        return newList
    }
}

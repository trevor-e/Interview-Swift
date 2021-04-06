import UIKit

//let head = ListNode(1)
//let l2 = ListNode(2)
//head.next = l2
//let l3 = ListNode(3)
//l2.next = l3
//let l4 = ListNode(4)
//l3.next = l4
//let l5 = ListNode(5)
//l4.next = l5

let l1 = TreeNode(1)
let l2 = TreeNode(3)
let l3 = TreeNode(2)
let l4 = TreeNode(5)
l1.left = l2; l1.right = l3; l2.left = l4

let r1 = TreeNode(2)
let r2 = TreeNode(1)
let r3 = TreeNode(3)
let r4 = TreeNode(4)
let r5 = TreeNode(7)
r1.left = r2; r1.right = r3; r2.right = r4; r3.right = r5

print(Solution617().mergeTrees(l1, r1)?.printTree())
print()

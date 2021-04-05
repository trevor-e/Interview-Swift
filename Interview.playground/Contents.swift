import UIKit

let head = ListNode(1)
let l2 = ListNode(2)
head.next = l2
let l3 = ListNode(3)
l2.next = l3
let l4 = ListNode(4)
l3.next = l4
let l5 = ListNode(5)
l4.next = l5

let grid: [[Int]] = [[0,0,1,0,0,0,0,1,0,0,0,0,0],
                     [0,0,0,0,0,0,0,1,1,1,0,0,0],
                     [0,1,1,0,1,0,0,0,0,0,0,0,0],
                     [0,1,0,0,1,1,0,0,1,0,1,0,0],
                     [0,1,0,0,1,1,0,0,1,1,1,0,0],
                     [0,0,0,0,0,0,0,0,0,0,1,0,0],
                     [0,0,0,0,0,0,0,1,1,1,0,0,0],
                     [0,0,0,0,0,0,0,1,1,0,0,0,0]]
print(Solution127().ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"]))
print()

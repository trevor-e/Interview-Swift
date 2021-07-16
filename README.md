# Interview-Swift
Leetcode solutions written in Swift.

Some data structures borrowed from [Swift Algorithms Club](https://github.com/raywenderlich/swift-algorithm-club) to make up for Swift's very small stdlib.

## Running
Playgrounds can be very finnicky to get working. I've found it best to manually save the solution file before running the Playground with test data. If you need to reference a helper file, autocomplete likely won't work and it will give warnings/errors that can be ignored. Despite its flaws, this workflow is still way faster than writing/submitting in the Leetcode editor. Don't forget to try some of these by hand on a piece of paper too!

## Data Structures
You should be comfortable using the following data structures:
- **Min/Max Heap (Priority Queue):** efficiently store the min/max value of a sequence. 
- **Deque:** a double-ended queue that allows for efficient access and removal on both ends.
    - Can be used to represent a **stack** and **queue** based on how you insert and remove items.
    - **Monotonic Stack:** items are either increasing or decreasing. Has the best time complexity solution O(N) for range queries in an array.
- **Trees:** remember the average and worst case performance.
    - **Binary Search Tree:** allows for efficient storage of a sorted sequence.
- **Graphs:** undirected or directed network of nodes. Be sure to know the different ways they can be represented (pointers, adjacency list).

## Tips

### Binary Trees
- For level-order traversal, use a Queue to store each level. You can either use an array to store each of the children as you enequeue them, or you can store the current count to know how many elements to dequeue.
- Some solutions can be made with in-order traversal since you're reading the nodes in a natural way.

### Binary Search
- Binary search can be used in a lot of applications. If the problem mentions the input is sorted then consider using this.
- In a more abstract sense it can also be used in min/max problems when converging on a solution.
- Be careful on even size inputs since there are two middles.
    - When the search space eventually becomes only two elements, they are represented by hi/low.
    - Should generally pick the lower-middle via `mid = (low + high) / 2`.

```
let low = blah.startIndex
let high = blah.endIndex
while low < high {
    let mid = (low + high) / 2
    if solutionIsTooHigh(mid) {
        low = blah.index(after: mid)
    } else {
        high = mid
    }
}
```

### Graphs
- Use a map/set to keep track of visited nodes while searching.

### Linked Lists
- Be able to find the middle of a list using slow/fast pointers.
- Be able to reverse a linked list.

### Word Transformations
- Try to precomute word neighbors using a placeholder (eg "*") in a dictionary with the value pointing back to the original word.

### Math
Exponents:
- 2^0 = 1
- 2^1 = 2
- 2^-2 = 1/(2*2) = 1/4
- 2^4 * 2^4 = 2^8

Helpers:
- 8.isMultiple(of: 2)

### Recursion
- Try to always use tail recursion otherwise it's easy to blow the stack on large inputs.
- Be careful since it can be deceiving, eg: `return n*fact(n-1)` is not tail recursive because it's accumulating the result of `n` in each function call. You can rewrite the function to accumulate the result instead: `return fact(n-1, n*a)`

### Big O
- If the input is halving each time then it's probably O(log n).
- Be careful of binary trees and mistakenly assuming O(n^2) complexity for something that's actually O(2^n), eg: the naive recursive solution for fibonacci numbers.

### Backtracking
Technique for solving recursive solutions by building the result incrementally. Recursive steps are eliminated if they fail to satisfy the constraints of the problem at any time, allowing you to speed up execution.

### Prefix Sum
For a lot of questions involving contiguous arrays (or subarrays) you can precompute the sums in another array such that `prefixSum[i] = arr[0] + arr[1] + arr[i]`.  Eg:
```
let array = [10, 20, 10, 5, 15]
let prefixSum = [0, 10, 30, 40, 45, 60] // Pad with a zero for convenience
```
Using this, if you ever need to calculate the sum of some range `i` to `j`, it becomes `prefixSum(j) - prefixSum(i)`. Eg:
the sum of 1-3 would be 

### Sliding Window
Allows you to efficiently compute a solution over a range of values, that might otherwise require a nested for-loop. Eg: finding the maximum sum of k consecutive elements in an array you can add/remove elements to the window.

Hints: if the problem mentions "consecutive" or the input array is sorted.
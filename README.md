# Interview-Swift
Leetcode solutions written in Swift.

Some data structures borrowed from [Swift Algorithms Club](https://github.com/raywenderlich/swift-algorithm-club) to make up for Swift's very small stdlib.

## Running
Playgrounds can be very finnicky to get working. I've found it best to manually save the solution file before running the Playground with test data. If you need to reference a helper file, autocomplete likely won't work and it will give warnings/errors that can be ignored. Despite its flaws, this workflow is still way faster than writing/submitting in the Leetcode editor. Don't forget to try some of these by hand on a piece of paper too!

## Tips

### Binary Trees
- For level-order traversal, use a Queue to store each level. You can either use an array to store each of the children as you enequeue them, or you can store the current count to know how many elements to dequeue.
- Some solutions can be made with in-order traversal since you're reading the nodes in a natural way.

### Graphs
- Use a map/set to keep track of visited nodes while searching.

### Linked Lists
- Be able to find the middle of a list using slow/fast pointers.
- Be able to reverse a linked list.

### Word Transformations
- Try to precomute word neighbors using a placeholder (eg "*") in a dictionary with the value pointing back to the original word.

### Finding K largest elements
- Use a min-heap (note: the opposite of what we're searching for) to store elements in a sorted order. Then remove elements from the heap until the size == k.

### Math
Exponents:
- 2^0 = 1
- 2^1 = 2
- 2^-2 = 1/(2*2) = 1/4
- 2^4 * 2^4 = 2^8

Helpers:
- 8.isMultiple(of: 2)

## Recursion
- Try to always use tail recursion otherwise it's easy to blow the stack on large inputs.
- Be careful since it can be deceiving, eg: `return n*fact(n-1)` is not tail recursive because it's accumulating the result of `n` in each function call. You can rewrite the function to accumulate the result instead: `return fact(n-1, n*a)`

## Big O
- If the input is halving each time then it's probably O(log n).
- Be careful of binary trees and mistakenly assuming O(n^2) complexity for something that's actually O(2^n), eg: the naive recursive solution for fibonacci numbers.

## Backtracking
Technique for solving recursive solutions by building the result incrementally. Recursive steps are eliminated if they fail to satisfy the constraints of the problem at any time, allowing you to speed up execution.

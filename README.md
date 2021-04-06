# Interview-Swift
Leetcode solutions written in Swift.

Some data structures borrowed from [Swift Algorithms Club](https://github.com/raywenderlich/swift-algorithm-club) to make up for Swift's very small stdlib.

## Running
Playgrounds can be very finnicky to get working. I've found it best to manually save the solution file before running the Playground with test data. If you need to reference a helper file, autocomplete likely won't work and it will give warnings/errors that can be ignored. Despite its flaws, this workflow is still way faster than writing/submitting in the Leetcode editor. Don't forget to try some of these by hand on a piece of paper too!

## Tips

### Binary Trees
- For level-order traversal, use a Queue to store each level. You can either use an array to store each of the children as you enequeue them, or you can store the current count to know how many elements to dequeue.

### Graphs
- Try to mark nodes as visited to make searching easier.

### Word Transformations
- Try to precomute word neighbors using a placeholder (eg "*") in a dictionary with the value pointing back to the original word.
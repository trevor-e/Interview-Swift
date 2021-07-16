import Foundation

public class Solution127 {
    public init() {}
    public func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var ladderMap = [String: Set<String>]()
        let length = beginWord.count
        
        // Prime the ladder map with all of the one-substitution word list combinations
        for word in wordList {
            for i in 0..<length {
                var adjusted = Array(word)
                adjusted[i] = "*"
                ladderMap[String(adjusted), default: []].insert(word)
            }
        }
        
        // Starting with the startWord, do a BFS of each word in the queue and check if each
        // one-substitution exists in the ladderMap. If we find a match, continue the BFS on those
        // until we either find our word or exhaust the BFS queue (meaning no solution).
        var visited = Set<String>()
        var queue = Queue<(word: String, transformCount: Int)>()
        queue.enqueue((beginWord, 1))
        
        while !queue.isEmpty {
            guard let (word, transformCount) = queue.dequeue(), !visited.contains(word) else { continue }
            
            visited.insert(word)
            
            if word == endWord {
                return transformCount
            }
            
            let newTransformCount = transformCount + 1
            
            for i in 0..<length {
                var adjusted = Array(word)
                adjusted[i] = "*"
                if let ladderWords = ladderMap[String(adjusted)] {
                    ladderWords.forEach { queue.enqueue(($0, newTransformCount)) }
                }
            }
        }
        
        return 0
    }
}

import Foundation

public protocol Master {
    func guess(_ word: String) -> Int
}

/// Definitely read the problem statement carefully. There's no guarantee that we'll ever get the guess
/// correctly in only 10 tries since the strings could be "aaaaaa", "bbbbbb", etc.
/// Knowing that, we can pop the first word and make a guess. Then, we can map the wordlist to the amount
/// of overlap with our guess and use the value with the minimum overlap (over the minimum) as our next guess in order to maximize our chance.
public class Solution843 {
    public init() {}
    public func findSecretWord(_ wordlist: [String], _ master: Master) {
        var wordlist = wordlist
        var currentWord = wordlist.removeFirst()
        var overlap = master.guess(currentWord)
        var guessesMade = 1
        while guessesMade < 10 {
            if overlap == 6 { break }
            let wordlistAndCount: [(Int, String)] = wordlist
                .map { word in (wordOverlap(currentWord, word), word) }
                .filter { $0.0 >= overlap }
                .sorted { $0.0 <= $1.0 }
            wordlist = wordlistAndCount.map { $0.1 }
            currentWord = wordlist.removeFirst()
            overlap = master.guess(currentWord)
            guessesMade += 1
        }
    }
    private func wordOverlap(_ firstWord: String, _ secondWord: String) -> Int {
        var count = 0
        for (first, second) in zip(firstWord, secondWord) {
            if first == second {
                count += 1
            }
        }
        return count
    }
}

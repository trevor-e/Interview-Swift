import Foundation

class Logger {
    private var timestamps = [String: Int]()
    init() {}
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        let validMessageTime = timestamps[message]
        if validMessageTime == nil || validMessageTime! <= timestamp {
            timestamps[message] = timestamp + 10
            return true
        } else {
            return false
        }
    }
}

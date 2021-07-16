import Foundation

public class Solution1776 {
    public init() {}
    public func getCollisionTimes(_ cars: [[Int]]) -> [Double] {
        var result = [Double]()
        var stack = [(Int, Int, Double)]()
        for car in cars.reversed() {
            // If the current car is slower than the HEAD then we won't collide.
            // If the current car has a slower collision time with HEAD then we can ignore this entry
            // and find the next collision
            while !stack.isEmpty
                    && (car.speed <= stack.last!.1
                            || collisionTime(car, [stack.last!.0, stack.last!.1]) >= stack.last!.2) {
                print("\(car.speed) \(stack.last!.1) \(collisionTime(car, [stack.last!.0, stack.last!.1])) \(stack.last!.2)")
                stack.removeLast()
            }
            // Since we are iterating from the right side, if the stack is empty then the car
            // can't collide with anything
            if stack.isEmpty {
                print("append")
                result.append(-1)
                stack.append((car.position, car.speed, Double.infinity))
            }
            // Otherwise, we can compute the collision time of the current car with the top of the stack
            else {
                let top = stack.last!
                let collisionTime = collisionTime(car, [top.0, top.1])
                result.append(collisionTime)
                stack.append((car.position, car.speed, collisionTime))
            }
        }
        return result.reversed()
    }
    private func collisionTime(_ car1: [Int], _ car2: [Int]) -> Double {
        Double(car2.position - car1.position) / Double(car1.speed - car2.speed)
    }
}
private extension Array where Element == Int {
    var position: Int { self[0] }
    var speed: Int { self[1] }
    var collisionTime: Int { self[2] }
}

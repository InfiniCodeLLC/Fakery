import CoreGraphics
import Foundation

public extension Phony {
    final class Number {
        fileprivate var lastUsedId: Int64 = 0

        public func randomBool() -> Bool {
            return self.randomInt() % 2 == 0
        }

        public func randomInt(min: Int = 0, max: Int = 1000) -> Int {
            var rand = Int.random(in: 0..<Int.max)

            if max >= 0 && max - Int.max >= min {
                return min + rand
            }

            return min + (rand % (max - min))
        }

        public func random(in range: Range<Int>) -> Int {
            var rand = Int.random(in: range)

            guard let max = range.max(), let min = range.min() else { return -1 }

            if max >= 0 && max - Int.max >= min {
                return min + rand
            }

            return min + (rand % (max - min))
        }

        public func randomFloat(min: Float = 0, max: Float = 1000) -> Float {
            return (Float.random(in: 0..<Float.greatestFiniteMagnitude) / Float.greatestFiniteMagnitude) * (max - min) + min
        }

        public func randomCGFloat(min: CGFloat = 0, max: CGFloat = 1000) -> CGFloat {
            return CGFloat(Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
        }

        public func randomDouble(min: Double = 0, max: Double = 1000) -> Double {
            return (Double.random(in: 0..<Double.greatestFiniteMagnitude) / Double.greatestFiniteMagnitude)
                * (max - min) + min
        }

        public func increasingUniqueId() -> Int {
            OSAtomicIncrement64(&self.lastUsedId)
            return Int(self.lastUsedId)
        }
    }
}

import Foundation

public extension Phony {
    final class Gender: Generator {
        public func type() -> String {
            guard let type = data.genderType.random() else { return "" }
            return type
        }

        public func binaryType() -> String {
            guard let binaryType = data.genderBinaryType.random() else { return "" }
            return binaryType
        }
    }
}

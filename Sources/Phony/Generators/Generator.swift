import Foundation

public extension Phony {
    class Generator {
        // swiftlint:disable nesting
        public struct Constants {
            public static let uppercaseLetters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            public static let letters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
            public static let numbers = Array("0123456789")
        }

        let data: any MockData
        let dateFormatter: DateFormatter

        public required init(data: any MockData) {
            self.data = data
            self.dateFormatter = DateFormatter()
            self.dateFormatter.dateFormat = "yyyy-MM-dd"
        }

        // MARK: - Filling

        public func numerify(_ string: String) -> String {
            let count = UInt32(Constants.numbers.count)

            return String(string.enumerated().map { index, item in
                let numberIndex = index == 0 ? UInt32.random(in: 0..<(count - 1)) : UInt32.random(in: 0..<count)
                let char = Constants.numbers[Int(numberIndex)]
                return String(item) == "#" ? char : item
            })
        }

        public func letterify(_ string: String) -> String {
            return String(string.enumerated().map { _, item in
                let char = Constants.uppercaseLetters.randomElement() ?? Character("")
                return String(item) == "?" ? char : item
            })
        }

        public func bothify(_ string: String) -> String {
            return self.letterify(self.numerify(string))
        }

        public func alphaNumerify(_ string: String) -> String {
            return string.replacingOccurrences(
                of: "[^A-Za-z0-9_]",
                with: "",
                options: .regularExpression,
                range: nil
            )
        }

        public func randomWords(from wordsList: [[String]]) -> String {
            var string = ""

            var list = [String]()
            for words in wordsList {
                if let item = words.random() {
                    list.append(item)
                }
            }

            string = list.joined(separator: " ")

            return string
        }
    }
}

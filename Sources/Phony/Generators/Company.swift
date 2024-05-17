import Foundation

public extension Phony {
    final class Company: Generator {
        public func name() -> String {
            guard let lastName = data.nameLastName.random() else { return "" }
            let index = Int.random(in: 0...2)

            switch index {
            case 0:
                return "\(lastName) \(self.suffix())"
            case 1:
                guard let lastName2 = data.nameLastName.random() else { return "" }
                return "\(lastName)-\(lastName2)"
            default:
                guard let lastName2 = data.nameLastName.random(), let lastName3 = data.nameLastName.random() else { return "" }
                return "\(lastName), \(lastName2) and \(lastName3)"
            }
        }

        public func suffix() -> String {
            return data.companySuffix.random() ?? ""
        }

        public func catchPhrase() -> String {
            return randomWords(from: data.companyBuzzwords)
        }

        public func bs() -> String {
            return randomWords(from: data.companyBs)
        }

        public func logo() -> String {
            let number = Int.random(in: 0..<13) + 1
            return "https://pigment.github.io/fake-logos/logos/medium/color/\(number).png"
        }
    }
}

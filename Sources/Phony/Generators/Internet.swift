import Foundation

public extension Phony {
    final class Internet: Generator {
        public required init(data: any MockData) {
            super.init(data: data)
        }

        public func username(separator: String? = nil) -> String {
            let lastRandomComponent = Int.random(in: 0..<10000)
            let components: [String] = [
                data.nameFirstName.random()!,
                data.nameLastName.random()!,
                "\(lastRandomComponent)"
            ]

            let randomCount = components.count - 1
            let count = Int.random(in: 0..<randomCount) + randomCount

            var gap = ""
            if let sep = separator {
                gap = sep
            }

            return components[0..<count].joined(separator: gap)
                .replacingOccurrences(of: "'", with: "")
                .lowercased()
        }

        public func domainName(_ alphaNumericOnly: Bool = true) -> String {
            return self.domainWord(alphaNumericOnly: alphaNumericOnly) + "." + self.domainSuffix()
        }

        public func domainWord(alphaNumericOnly: Bool = true) -> String {
            guard let lastName = data.nameLastName.random() else { return "" }
            let index = Int.random(in: 0...2)
            let companyName: String
            switch index {
            case 0:
                companyName = "\(lastName) \(data.companySuffix.random() ?? "")"
            case 1:
                guard let lastName2 = data.nameLastName.random() else { return "" }
                companyName = "\(lastName)-\(lastName2)"
            default:
                guard let lastName2 = data.nameLastName.random(), let lastName3 = data.nameLastName.random() else { return "" }
                companyName = "\(lastName), \(lastName2) and \(lastName3)"
            }
            let nameParts = companyName.components(separatedBy: " ")
            var name = ""

            if let first = nameParts.first {
                name = first
            } else {
                name = letterify("?????")
            }

            let result = alphaNumericOnly ? alphaNumerify(name) : name

            return result.lowercased()
        }

        public func domainSuffix() -> String {
            return data.internetDomainSuffix.random() ?? ""
        }

        public func email() -> String {
            return [self.username(), self.domainName()].joined(separator: "@")
        }

        public func freeEmail() -> String {
            return [self.username(), data.internetFreeEmail.random() ?? ""].joined(separator: "@")
        }

        public func safeEmail() -> String {
            let topLevelDomains = ["org", "com", "net"]
            let topLevelDomain = topLevelDomains.randomElement() ?? ""

            return [self.username(), "example." + topLevelDomain].joined(separator: "@")
        }

        public func password(minimumLength: Int = 8, maximumLength: Int = 16) -> String {
            var temp = String.characters(amount: minimumLength)
            let diffLength = maximumLength - minimumLength

            if diffLength > 0 {
                let diffRandom = Int.random(in: 0..<diffLength + 1)
                temp += String.characters(amount: diffRandom)
            }

            return temp
        }

        public func ipV4Address() -> String {
            let randomNumber = UInt32.random(in: 0..<UInt32.max) % 253
            let ipRand = {
                2 + randomNumber
            }

            return String(format: "%d.%d.%d.%d", ipRand(), ipRand(), ipRand(), ipRand())
        }

        public func ipV6Address() -> String {
            let randomNumber = UInt32.random(in: 0..<UInt32.max) % 65536

            var components: [String] = []

            for _ in 0..<8 {
                components.append(String(format: "%X", randomNumber))
            }

            return components.joined(separator: ":")
        }

        public func url() -> String {
            return "https://\(self.domainName())/\(self.username())"
        }

        public func image(width: Int = 320, height: Int = 200) -> String {
            return "https://lorempixel.com/\(width)/\(height)"
        }

        public func templateImage(
            width: Int = 320,
            height: Int = 200,
            backColorHex: String = "000000",
            frontColorHex: String = "ffffff"
        ) -> String {
            return "https://dummyimage.com/\(width)x\(height)/\(backColorHex)/\(frontColorHex)"
        }

        public func hashtag() -> String {
            return data.internetHashtag.random() ?? ""
        }
    }
}

public extension Phony {
    final class Name: Generator {
        public func name() -> String {
            guard let firstName = data.nameFirstName.random(), let lastName = data.nameLastName.random() else { return "" }
            let index = Int.random(in: 0...5)
            switch index {
            case 0:
                return "\(self.prefix()) \(firstName) \(lastName)"
            case 1:
                return "\(firstName) \(lastName) \(self.suffix())"
            default:
                return "\(firstName) \(lastName)"
            }
        }

        public func firstName() -> String {
            return data.nameFirstName.random() ?? ""
        }

        public func lastName() -> String {
            return data.nameLastName.random() ?? ""
        }

        public func prefix() -> String {
            return data.namePrefix.random() ?? ""
        }

        public func suffix() -> String {
            return data.nameSuffix.random() ?? ""
        }

        public func title() -> String {
            guard let descriptor = data.nameTitleDescriptor.random(), let level = data.nameTitleLevel.random(), let job = data.nameTitleJob.random() else { return "" }
            return "\(descriptor) \(level) \(job)"
        }
    }
}

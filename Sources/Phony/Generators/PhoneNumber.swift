public extension Phony {
    final class PhoneNumber: Generator {
        public func phoneNumber() -> String {
            return numerify(data.phoneNumberFormats.random() ?? "")
        }

        public func numberExtension(_ length: Int) -> String {
            var template = ""

            for _ in 1...length {
                template += "#"
            }

            return numerify(template)
        }
    }
}

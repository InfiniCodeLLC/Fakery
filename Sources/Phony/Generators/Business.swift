import Foundation

public extension Phony {
    final class Business: Generator {
        public func creditCardNumber() -> String {
            return data.businessCreditCardNumbers.random() ?? ""
        }

        public func creditCardType() -> String {
            return data.businessCreditCardTypes.random() ?? ""
        }

        public func creditCardExpiryDate() -> Foundation.Date? {
            guard let dateString = data.businessCreditCardExpiryDates.random() else { return nil }
            return dateFormatter.date(from: dateString)
        }
    }
}

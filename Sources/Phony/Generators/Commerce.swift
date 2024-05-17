import Foundation

public extension Phony {
    final class Commerce: Generator {
        public func color() -> String {
            guard let color = data.commerceColor.random() else { return "" }
            return color
        }

        public func department(maximum: Int = 3, fixedAmount: Bool = false) -> String {
            let amount = fixedAmount ? maximum : 1 + Int.random(in: 0..<maximum)
            let fetchedCategories = self.categories(amount)
            let count = fetchedCategories.count

            var department = ""

            if count > 1 {
                department = self.merge(categories: fetchedCategories)
            } else if count == 1 {
                department = fetchedCategories[0]
            }

            return department
        }

        public func productName() -> String {
            guard let adjective = data.commerceProductNameAdjective.random(), let material = data.commerceProductNameMaterial.random(), let product = data.commerceProductNameProduct.random() else { return "" }
            return "\(adjective) \(material) \(product)"
        }

        public func price() -> Double {
            let arc4randoMax: Double = 0x100000000
            return floor(Double((Double(UInt32.random(in: 0..<UInt32.max)) / arc4randoMax) * 100.0) * 100) / 100.0
        }

        // MARK: - Helpers

        public func categories(_ amount: Int) -> [String] {
            var categories: [String] = []

            while categories.count < amount {
                guard let category = data.commerceDepartment.random() else { return [] }

                if !categories.contains(category) {
                    categories.append(category)
                }
            }

            return categories
        }

        public func merge(categories: [String]) -> String {
            let separator = data.separator
            let commaSeparated = categories[0..<categories.count - 1].joined(separator: ", ")

            return commaSeparated + separator + categories.last!
        }
    }
}

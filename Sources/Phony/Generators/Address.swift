import CoreLocation
import Foundation

public typealias Location = CLLocationCoordinate2D

public extension Phony {
    final class Address: Generator {
        public func city() -> String {
            let number = Int.random(in: 0...4)

            switch number {
            case 0:
                guard let prefix = data.addressCityPrefix.random(), let firstName = data.nameFirstName.random(), let suffix = data.addressCitySuffix.random() else { return "" }
                return "\(prefix) \(firstName)\(suffix)"
            case 1:
                guard let prefix = data.addressCityPrefix.random(), let firstName = data.nameFirstName.random() else { return "" }
                return "\(prefix) \(firstName)"
            case 2:
                guard let firstName = data.nameFirstName.random(), let suffix = data.addressCitySuffix.random() else { return "" }
                return "\(firstName)\(suffix)"
            default:
                guard let lastName = data.nameLastName.random(), let suffix = data.addressCitySuffix.random() else { return "" }
                return "\(lastName)\(suffix)"
            }
        }

        public func streetName() -> String {
            if Bool.random() {
                guard let firstName = data.nameFirstName.random(), let suffix = data.addressStreetSuffix.random() else { return "" }
                return "\(firstName) \(suffix)"
            } else {
                guard let lastName = data.nameLastName.random(), let suffix = data.addressStreetSuffix.random() else { return "" }
                return "\(lastName) \(suffix)"
            }
        }

        public func secondaryAddress() -> String {
            return numerify(data.addressSecondaryAddress.random() ?? "")
        }

        public func streetAddress(includeSecondary: Bool = false) -> String {
            let streetName = streetName()
            guard let buildingNumber = data.addressBuildingNumber.random(), !streetName.isEmpty else { return "" }
            var streetAddress = numerify("\(buildingNumber) \(streetName)")

            if includeSecondary {
                let secondary = self.secondaryAddress()
                if !secondary.isEmpty {
                    streetAddress += " " + secondary
                }
            }

            return streetAddress
        }

        public func buildingNumber() -> String {
            return bothify(data.addressBuildingNumber.random() ?? "")
        }

        public func postcode() -> String {
            return bothify(data.addressPostcode.random() ?? "")
        }

        public func streetSuffix() -> String {
            return data.addressStreetSuffix.random() ?? ""
        }

        public func citySuffix() -> String {
            return data.addressCitySuffix.random() ?? ""
        }

        public func cityPrefix() -> String {
            return data.addressCityPrefix.random() ?? ""
        }

        public func stateAbbreviation() -> String {
            return data.addressStateAbbr.random() ?? ""
        }

        public func state() -> String {
            return data.addressState.random() ?? ""
        }

        public func county() -> String {
            return data.addressCounty.random() ?? ""
        }

        public func country() -> String {
            return data.addressCountry.random() ?? ""
        }

        public func countryCode() -> String {
            return data.addressCountryCode.random() ?? ""
        }

        public func latitude() -> Double {
            return drand48() * 180.0 - 90.0
        }

        public func longitude() -> Double {
            return drand48() * 360.0 - 180.0
        }

        public func coordinate(inRadius radius: Double, fromCenter center: Location) -> Location {
            let y0 = center.latitude
            let x0 = center.longitude

            // Convert meters to degrees for radius
            let radiusInDegrees = radius / 111300.0

            // Random point in circle
            let rhoRandom = Double.random(in: 0..<Double.greatestFiniteMagnitude) / 0xFFFFFFFF
            let phiRandom = Double.random(in: 0..<Double.greatestFiniteMagnitude) / 0xFFFFFFFF
            let rho = radiusInDegrees * sqrt(rhoRandom)
            let phi = 2 * .pi * phiRandom
            let xPos = rho * cos(phi)
            let yPos = rho * sin(phi)

            // Adjust longitude (x) to adjust for east-west shrinking in distance
            let latRadians = y0 * .pi / 180
            let newx = xPos / cos(latRadians)

            // Set found random point
            let foundLatitude = yPos + y0
            let foundLongitude = newx + x0

            return Location(latitude: foundLatitude, longitude: foundLongitude)
        }
    }
}

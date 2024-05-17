import Nimble
@testable import Phony
import Quick

final class PhoneNumberSpec: QuickSpec {
    override func spec() {
        describe("PhoneNumber") {
            var phoneNumber: Phony.PhoneNumber!

            beforeEach {
                let data = TestMockData()
                phoneNumber = Phony.PhoneNumber(data: data)
            }

            describe("#phoneNumber") {
                it("generates the correct text") {
                    let phone = phoneNumber.phoneNumber()
                    expect(phone).to(match("^\\d{3}-\\d{3}-\\d{4}$"))
                }
            }

            describe("#numberExtension") {
                it("generates the correct text with specified number of digits") {
                    let numberExtension = phoneNumber.numberExtension(5)
                    expect(numberExtension).to(match("^\\d{5}$"))
                }
            }
        }
    }
}

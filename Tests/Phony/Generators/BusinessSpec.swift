import Nimble
@testable import Phony
import Quick

final class BusinessSpec: QuickSpec {
    override func spec() {
        describe("Business") {
            var business: Phony.Business!

            beforeEach {
                let data = TestMockData()
                business = Phony.Business(data: data)
            }

            describe("#creditCardNumber") {
                it("returns the correct text") {
                    let creditCardNumber = business.creditCardNumber()
                    expect(creditCardNumber).to(equal("1234-2121-1221-1211"))
                }
            }

            describe("#creditCardType") {
                it("returns the correct text") {
                    let creditCardType = business.creditCardType()
                    expect(creditCardType).to(equal("visa"))
                }
            }

            describe("#creditCardExpiryDate") {
                it("returns the correct text") {
                    let creditCardExpiryDate = business.creditCardExpiryDate()
                    expect(creditCardExpiryDate).notTo(beNil())
                    if let date = creditCardExpiryDate {
                        let dateString = business.dateFormatter.string(from: date)
                        expect(dateString).to(equal("2020-10-12"))
                    }
                }
            }
        }
    }
}

import Nimble
@testable import Phony
import Quick

final class GenderSpec: QuickSpec {
    override func spec() {
        describe("Gender") {
            var gender: Phony.Gender!

            beforeEach {
                let data = TestMockData()
                gender = Phony.Gender(data: data)
            }

            describe("#type") {
                it("returns the correct text") {
                    let type = gender.type()
                    expect(type).to(equal("Non-binary"))
                }
            }

            describe("#binary_type") {
                it("returns the correct text") {
                    let binaryType = gender.binaryType()
                    expect(binaryType).to(equal("Male"))
                }
            }
        }
    }
}

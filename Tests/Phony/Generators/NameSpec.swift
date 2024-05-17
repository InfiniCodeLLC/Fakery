import Nimble
@testable import Phony
import Quick

final class NameSpec: QuickSpec {
    override func spec() {
        describe("Name") {
            var name: Phony.Name!

            beforeEach {
                let data = TestMockData()
                name = Phony.Name(data: data)
            }

            describe("#name") {
                it("returns the correct text") {
                    let text = name.name()
                    expect(text).verify(["Mr. Vadym Markov", "Vadym Markov", "Vadym Markov I"].contains(text), FailureMessage(stringValue: "Name '\(text)' did not match."))
                }
            }

            describe("#firstName") {
                it("returns the correct text") {
                    let firstName = name.firstName()
                    expect(firstName).to(equal("Vadym"))
                }
            }

            describe("#lastName") {
                it("returns the correct text") {
                    let lastName = name.lastName()
                    expect(lastName).to(equal("Markov"))
                }
            }

            describe("#prefix") {
                it("returns the correct text") {
                    let prefix = name.prefix()
                    expect(prefix).to(equal("Mr."))
                }
            }

            describe("#suffix") {
                it("returns the correct text") {
                    let suffix = name.suffix()
                    expect(suffix).to(equal("I"))
                }
            }

            describe("#title") {
                it("returns the correct text") {
                    let title = name.title()
                    expect(title).to(equal("Lead Mobility Engineer"))
                }
            }
        }
    }
}

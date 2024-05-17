import Nimble
@testable import Phony
import Quick

final class CompanySpec: QuickSpec {
    override func spec() {
        describe("Company") {
            var company: Phony.Company!

            beforeEach {
                let data = TestMockData()
                company = Phony.Company(data: data)
            }

            describe("#name") {
                it("returns the correct text") {
                    let name = company.name()
                    expect(name).verify(["Markov Inc", "Markov, Markov and Markov", "Markov-Markov"].contains(name), FailureMessage(stringValue: "Name '\(name)' did not match."))
                }
            }

            describe("#suffix") {
                it("returns the correct text") {
                    let suffix = company.suffix()
                    expect(suffix).to(equal("Inc"))
                }
            }

            describe("#catchPhrase") {
                it("generates random catch phrase") {
                    let phrase = company.catchPhrase()
                    expect(phrase).to(equal("Universal 24 hour software"))
                }
            }

            describe("#bs") {
                it("generates random BS") {
                    let bs = company.bs()
                    expect(bs).to(equal("implement innovative methodologies"))
                }
            }

            describe("#logo") {
                it("generates random logo") {
                    let logo = company.logo()
                    expect(logo).to(match("^https://pigment.github.io/fake-logos/logos/medium/color/\\d+.png$"))
                }
            }
        }
    }
}

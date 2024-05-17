import Nimble
@testable import Phony
import Quick

final class GeneratorSpec: QuickSpec {
    override func spec() {
        describe("Generator") {
            var generator: Phony.Generator!
            var data: TestMockData!

            beforeEach {
                data = TestMockData()
                generator = Phony.Generator(data: data)
            }

            it("has parser") {
                expect(generator.data).notTo(beNil())
            }

            describe("filling") {
                describe("#numerify") {
                    it("replaces # with random numbers") {
                        let numerified = generator.numerify("12####")
                        expect(Int(numerified)).notTo(beNil())
                        expect(numerified.contains("#")).to(beFalse())
                        expect(numerified).to(match("^12\\d{4}$"))
                    }
                }

                describe("#letterify") {
                    it("replaces ? with random letters") {
                        let letterified = generator.letterify("This is awes?me")
                        expect(letterified.contains("?")).to(beFalse())
                        expect(letterified).to(match("^This is awes[A-Za-z]me$"))
                    }
                }

                describe("#bothify") {
                    it("replaces # with random numbers and ? with random letters") {
                        let bothified = generator.bothify("#th of ?pril")
                        expect(bothified.contains("#")).to(beFalse())
                        expect(bothified.contains("?")).to(beFalse())
                        expect(bothified).to(match("^\\dth of [A-Za-z]pril$"))
                    }
                }

                describe("#alphaNumerify") {
                    it("removes special characters") {
                        let latin = generator.alphaNumerify("Øghdasæå!y_=a")
                        expect(latin).to(equal("ghdasy_a"))
                    }
                }

                describe("#randomWordsFromKey") {
                    it("generates random words") {
                        let phrase = generator.randomWords(from: data.companyBuzzwords)
                        expect(phrase).to(equal("Universal 24 hour software"))
                    }
                }
            }
        }
    }
}

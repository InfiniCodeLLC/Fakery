import Nimble
@testable import Phony
import Quick

final class PhonySpec: QuickSpec {
    override func spec() {
        describe("Phony") {
            var phony: Phony!
            var data: TestMockData!

            beforeEach {
                data = TestMockData()
                phony = Phony(data: data)
            }

            describe("#init") {
                it("sets default values") {
                    expect(phony.data).to(beAKindOf(TestMockData.self))
                    expect(phony.address.data).to(beAKindOf(TestMockData.self))
                    expect(phony.business.data).to(beAKindOf(TestMockData.self))
                    expect(phony.commerce.data).to(beAKindOf(TestMockData.self))
                    expect(phony.gender.data).to(beAKindOf(TestMockData.self))
                    expect(phony.internet.data).to(beAKindOf(TestMockData.self))
                    expect(phony.lorem.data).to(beAKindOf(TestMockData.self))
                    expect(phony.name.data).to(beAKindOf(TestMockData.self))
                    expect(phony.phoneNumber.data).to(beAKindOf(TestMockData.self))
                }
            }

            describe("#address") {
                it("should be accessible") {
                    expect(phony.address).to(beAKindOf(Phony.Address.self))
                }
            }

            describe("#business") {
                it("should be accessible") {
                    expect(phony.business).to(beAKindOf(Phony.Business.self))
                }
            }

            describe("#commerce") {
                it("should be accessible") {
                    expect(phony.commerce).to(beAKindOf(Phony.Commerce.self))
                }
            }

            describe("#gender") {
                it("should be accessible") {
                    expect(phony.gender).to(beAKindOf(Phony.Gender.self))
                }
            }

            describe("#internet") {
                it("should be accessible") {
                    expect(phony.internet).to(beAKindOf(Phony.Internet.self))
                }
            }

            describe("#lorem") {
                it("should be accessible") {
                    expect(phony.lorem).to(beAKindOf(Phony.Lorem.self))
                }
            }

            describe("#name") {
                it("should be accessible") {
                    expect(phony.name).to(beAKindOf(Phony.Name.self))
                }
            }

            describe("#phoneNumber") {
                it("should be accessible") {
                    expect(phony.phoneNumber).to(beAKindOf(Phony.PhoneNumber.self))
                }
            }
        }
    }
}

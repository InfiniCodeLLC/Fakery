public final class Phony {
    public static var shared = Phony()

    public let address: Address
    public let business: Business
    public let company: Company
    public let commerce: Commerce
    public let gender: Gender
    public let internet: Internet
    public let lorem: Lorem
    public let name: Name
    public let phoneNumber: PhoneNumber
    public let number: Number
    public let date: Phony.Date

    let data: any MockData

    // MARK: - Initialization

    public init(data: any MockData = DefaultMockData()) {
        self.data = data
        self.address = Address(data: data)
        self.business = Business(data: data)
        self.company = Company(data: data)
        self.commerce = Commerce(data: data)
        self.gender = Gender(data: data)
        self.internet = Internet(data: data)
        self.lorem = Lorem(data: data)
        self.name = Name(data: data)
        self.phoneNumber = PhoneNumber(data: data)
        self.number = Number()
        self.date = Date()
    }
}

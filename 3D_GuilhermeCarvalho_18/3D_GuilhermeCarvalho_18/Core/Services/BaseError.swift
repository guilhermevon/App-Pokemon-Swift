struct BaseError: Codable, Error {
    let errorMessage: String
    let errorCode: Int
    
    public init(message: String, code: Int) {
        self.errorMessage = message
        self.errorCode = code
    }
}

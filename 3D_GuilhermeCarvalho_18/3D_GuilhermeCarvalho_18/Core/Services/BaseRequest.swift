import Alamofire

public typealias Parameters = [String: Any]

public typealias HttpMethod = HTTPMethod

public typealias Headers = HTTPHeaders

public protocol BaseRequestProtocol {
    var method: HttpMethod { get }
    var basePath: String { get }
    var path: String { get }
    var body: Parameters? { get }
    var headers: Headers? { get set }
}

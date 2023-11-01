
/*import Alamofire
import Foundation

internal protocol BaseServiceProtocol {
    func performRequest<T: Codable>(rout: BaseRequestProtocol,
                                    completion: @escaping(Result <T, Error>) -> Void)
}

internal class BaseService: BaseServiceProtocol {
    func performRequest<T: Codable>(rout: BaseRequestProtocol,
                           completion: @escaping (Result<T, Error>) -> Void) where T : Codable {
        
        AF.request(rout.path).responseDecodable(of: T.self){ result in
            if let value = result.value{
                completion(.success(value))
                return
            }
            if let error = result.error{
                completion(.failure(error))
                return
            }
            let error = self.errorHandler(by: result.data)
            completion(.failure(error))
        }
        
    }
    private func errorHandler(by: Data?) -> BaseError{
        if let data = by{
            do{
                let error = try JSONDecoder().decode(BaseError.self, from: data)
                return error
            } catch {
                let error = getGenericError("==> RE: Näo foi possivel manipular o resultado")
                return error
            }

        }
        return getGenericError()
    }
    
    
    private func getGenericError(_ message: String? = nil) -> BaseError{
        let messageError = message ?? "==> RE: Erro desconhecido."
        return BaseError(message: messageError, code: -1)
    }
}*/

import Foundation
import Alamofire

internal protocol BaseServiceProtocol {
    func performRequest<T: Codable>(route: BaseRequestProtocol, completion: @escaping(Result<T, Error>) -> Void)
}

internal class BaseService: BaseServiceProtocol {
    func performRequest<T: Codable>(route: BaseRequestProtocol, completion: @escaping (Result<T, Error>) -> Void) where T : Codable {
        
        
        AF.request(route.path).responseDecodable(of: T.self) { [weak self] response in
            guard let self = self else { return }
            if let value = response.value {
                completion(.success(value))
                return
            }
            if let error = response.error {
                completion(.failure(error))
                return
            }
            let error = self.errorHandler(by: response.data)
            completion(.failure(error))
        }
    }
    
    
    private func errorHandler(by: Data?) -> BaseError {
        if let data = by {
            do {
                let error = try JSONDecoder().decode(BaseError.self, from: data)
                return error
            } catch {
                return getGenericError("==> RE: Erro ao tentar manipular dados binários.")
            }
        }
        return getGenericError()
    }
    
    private func getGenericError(_ message: String? = nil ) -> BaseError {
        let messageError = message ?? "==> RE: Erro Desconhecido"
        return BaseError(message: messageError, code: -1)
    }
}

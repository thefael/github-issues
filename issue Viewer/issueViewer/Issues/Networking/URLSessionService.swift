import Foundation

protocol URLSessionServicing {
    func fetchData<T: Decodable>(fromURL url: URL, completion: @escaping ((Result<T, FetchError>) -> Void))
}

final class URLSessionService {
    private let decoder: JSONDecoder
    private let session: URLSession
    
    init(decoder: JSONDecoder = JSONDecoder(), session: URLSession = .shared) {
        self.decoder = decoder
        self.session = session
    }
}

extension URLSessionService: URLSessionServicing {
    func fetchData<T: Decodable>(fromURL url: URL, completion: @escaping ((Result<T, FetchError>) -> Void)) {
        session.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(.failedToFetch(error)))
            } else if let data =  data {
                do {
                    let object = try self.decoder.decode(T.self, from: data)
                    completion(.success(object))
                } catch let error {
                    completion(.failure(.failedToDecodeData(error)))
                }
            }
        }.resume()
    }
}

enum FetchError: Error {
    case failedToDecodeData(_ error: Error)
    case failedToFetch(_ error: Error)
}

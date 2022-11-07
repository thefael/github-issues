@testable import issueViewer
import Foundation

final class URLSessionServiceMock<U>: URLSessionServicing {
    var fetchDataArgs: (url: URL, completion: (Result<U, FetchError>) -> Void)?
    func fetchData<T>(fromURL url: URL, completion: @escaping ((Result<T, FetchError>) -> Void)) where T : Decodable {
        fetchDataArgs = (url: url, completion: completion as! (Result<U, FetchError>) -> Void)
    }
}

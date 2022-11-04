import Foundation

protocol IssuesInteracting {
    func loadData(fromURL url: URL)
}

final class IssuesInteractor {
    private let presenter: IssuesPresenting
    private let service: URLSessionServicing
    
    init(presenter: IssuesPresenting, service: URLSessionServicing) {
        self.presenter = presenter
        self.service = service
    }
}

extension IssuesInteractor: IssuesInteracting {
    func loadData(fromURL url: URL) {
        service.fetchData(fromURL: url) { (result: Result<[IssueItem], FetchError>) in
            switch result {
            case .success(let items):
                self.presenter.present(items: items)
            case .failure:
                break
            }
        }
    }
}

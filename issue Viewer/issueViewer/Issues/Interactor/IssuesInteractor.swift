import Foundation

protocol IssuesInteracting {
    func loadData()
}

final class IssuesInteractor {
    private let presenter: IssuesPresenting
    private let service: URLSessionServicing
    private let issuesPath: URL? = URL(string: "https://api.github.com/repos/apple/swift/issues")
    
    init(presenter: IssuesPresenting, service: URLSessionServicing) {
        self.presenter = presenter
        self.service = service
    }
}

extension IssuesInteractor: IssuesInteracting {
    func loadData() {
        guard let url = issuesPath else { return }
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

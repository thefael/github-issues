import Foundation

protocol IssuesInteracting {
    func loadData(fromURL url: URL)
    func didTapCell(atPosition position: Int)
}

final class IssuesInteractor {
    private let presenter: IssuesPresenting
    private let service: URLSessionServicing
    private var items: [IssueItem]?
    
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
                self.items = items
            case .failure:
                break
            }
        }
    }
    
    func didTapCell(atPosition position: Int) {
        guard let item = items?[position] else { return }
        presenter.presentIssueDetail(forItem: item)
    }
}

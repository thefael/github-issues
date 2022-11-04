import Foundation

protocol IssuesPresenting {
    func present(items: [IssueItem])
}

final class IssuesPresenter { }

extension IssuesPresenter: IssuesPresenting {
    func present(items: [IssueItem]) {
        // TODO: create ViewModel and Display protocol
    }
}

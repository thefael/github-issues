import Foundation

enum IssueListFactory {
    static func make() -> IssueListViewController {
        let presenter = IssuesPresenter()
        let service = URLSessionService()
        let interactor = IssuesInteractor(presenter: presenter, service: service)
        let viewController = IssueListViewController(interactor: interactor)
        presenter.display = viewController
        return viewController
    }
}

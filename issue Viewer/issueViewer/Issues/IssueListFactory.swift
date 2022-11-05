import UIKit

enum IssueListFactory {
    static func make(navigationController: UINavigationController) -> IssueListViewController {
        let coordinator = IssueListCoordinator(navigationController: navigationController)
        let presenter = IssuesPresenter(coordinator: coordinator)
        let service = URLSessionService()
        let interactor = IssuesInteractor(presenter: presenter, service: service)
        let viewController = IssueListViewController(interactor: interactor)
        presenter.display = viewController
        return viewController
    }
}

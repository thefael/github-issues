import UIKit

enum IssueDetailFactory {
    static func make(withItem item: IssueItem) -> IssueDetailViewController {
        let presenter = IssueDetailPresenter()
        let interactor = IssueDetailInteractor(item: item, presenter: presenter)
        let viewController = IssueDetailViewController(interactor: interactor)
        presenter.display = viewController
        return viewController
    }
}

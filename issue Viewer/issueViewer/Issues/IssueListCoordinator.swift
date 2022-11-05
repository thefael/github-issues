import UIKit

protocol IssueListCoordinating {
    func openIssueDetail()
}

final class IssueListCoordinator: IssueListCoordinating {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func openIssueDetail() {
        let issueDetailViewController = IssueDetailFactory.make()
        navigationController?.pushViewController(issueDetailViewController, animated: true)
    }
}

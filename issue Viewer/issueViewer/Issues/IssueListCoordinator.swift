import UIKit

protocol IssueListCoordinating {
    func openIssueDetail(withItem item: IssueItem)
}

final class IssueListCoordinator: IssueListCoordinating {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func openIssueDetail(withItem item: IssueItem) {
        let issueDetailViewController = IssueDetailFactory.make(withItem: item)
        navigationController?.pushViewController(issueDetailViewController, animated: true)
    }
}

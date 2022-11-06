import UIKit

protocol IssueDetailCoordinating {
    func open(link: String)
}

final class IssueDetailCoordinator: IssueDetailCoordinating {
    func open(link: String) {
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
}

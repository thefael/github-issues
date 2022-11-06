import UIKit

protocol IssueDetailPresenting {
    func present(item: IssueItem)
    func presentIssueLink(path: String)
}

final class IssueDetailPresenter {
    private let coordinator: IssueDetailCoordinating
    weak var display: IssueDetailDisplaying?
    
    init(coordinator: IssueDetailCoordinating) {
        self.coordinator = coordinator
    }
}

extension IssueDetailPresenter: IssueDetailPresenting {
    func present(item: IssueItem) {
        let viewModel = IssueDetailViewModel(
            user: .init(
                imagePath: item.user.avatarURL,
                name: item.user.login
            ),
            issue: .init(
                title: item.title, 
                description: item.body ?? "No description provided"
            )
        )
        display?.display(item: viewModel)
    }
    
    func presentIssueLink(path: String) {
        coordinator.open(link: path)
    }
}

struct IssueDetailViewModel {
    let user: User
    let issue: Issue
    
    struct User {
        let imagePath: String
        let name: String
    }
    
    struct Issue {
        let title: String
        let description: String
    }
}

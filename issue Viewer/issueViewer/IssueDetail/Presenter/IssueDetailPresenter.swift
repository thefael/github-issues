import UIKit

protocol IssueDetailPresenting {
    func present(item: IssueItem)
}

final class IssueDetailPresenter {
    weak var display: IssueDetailDisplaying?
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

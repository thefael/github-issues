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
                image: getImage(path: item.user.avatarURL),
                name: item.user.login
            ),
            issue: .init(
                title: item.title, 
                description: item.body ?? "No description provided"
            )
        )
        display?.display(item: viewModel)
    }
    
    private func getImage(path: String) -> UIImage {
        guard let url = URL(string: path), 
              let data = try? Data(contentsOf: url),
              let image = UIImage(data: data) 
        else { 
            return .init(systemName: "star.fill") ?? .init() 
        }
        return image
    }
}

struct IssueDetailViewModel {
    let user: User
    let issue: Issue
    
    struct User {
        let image: UIImage
        let name: String
    }
    
    struct Issue {
        let title: String
        let description: String
    }
}

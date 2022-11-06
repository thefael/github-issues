import Foundation

protocol IssueDetailInteracting {
    func loadData()
    func didTapIssueLink()
}

final class IssueDetailInteractor {
    private let item: IssueItem
    private let presenter: IssueDetailPresenting
    
    init(item: IssueItem, presenter: IssueDetailPresenting) {
        self.item = item
        self.presenter = presenter
    }
}

extension IssueDetailInteractor: IssueDetailInteracting {
    func loadData() {
        presenter.present(item: item)
    }
    
    func didTapIssueLink() {
        presenter.presentIssueLink(path: item.htmlURL)
    }
}

@testable import issueViewer

final class IssueDetailInteractorMock: IssueDetailInteracting {
    var loadDataAction: () -> Void = { fatalError() }
    var didTapISsueLinkAction: () -> Void = { fatalError() }
    func loadData() {
        loadDataAction()
    }
    
    func didTapIssueLink() {
        didTapISsueLinkAction()
    }
}

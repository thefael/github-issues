@testable import issueViewer

final class IssueDetailPresenterMock: IssueDetailPresenting {
    var presentItemAction: (IssueItem) -> Void = { _ in fatalError() }
    var presentIssueLinkAction: (String) -> Void = { _ in fatalError() }
    func present(item: IssueItem) {
        presentItemAction(item)
    }
    
    func presentIssueLink(path: String) {
        presentIssueLinkAction(path)
    }
}

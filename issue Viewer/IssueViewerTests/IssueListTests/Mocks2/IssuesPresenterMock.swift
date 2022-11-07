@testable import issueViewer

final class IssuesPresenterMock: IssuesPresenting {
    var presentItemsAction: ([IssueItem]) -> Void = { _ in fatalError() }
    var presentIssueDetailAction: (IssueItem) -> Void = { _ in fatalError() }
    func present(items: [IssueItem]) {
        presentItemsAction(items)
    }
    
    func presentIssueDetail(forItem item: IssueItem) {
        presentIssueDetailAction(item)
    }
}

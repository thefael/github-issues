@testable import issueViewer

final class IssuesPresenterMock: IssuesPresenting {
    var presentItemsAction: ([IssueItem]) -> Void = { _ in fatalError() }
    func present(items: [IssueItem]) {
        presentItemsAction(items)
    }
}

@testable import issueViewer

final class IssueListDisplayMock: IssueListDisplaying {
    var displayItemsAction: ([IssueViewModel]) -> Void = { _ in fatalError() }
    func display(items: [IssueViewModel]) {
        displayItemsAction(items)
    }
}

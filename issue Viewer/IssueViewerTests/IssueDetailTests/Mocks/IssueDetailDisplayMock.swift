@testable import issueViewer

final class IssueDetailDisplayMock: IssueDetailDisplaying {
    var displayItemAction: (IssueDetailViewModel) -> Void = { _ in fatalError() }
    func display(item: IssueDetailViewModel) {
        displayItemAction(item)
    }
}

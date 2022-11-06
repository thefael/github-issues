@testable import issueViewer

final class IssueListCoordinatorMock: IssueListCoordinating {
    var openIssueDetailAction: (IssueItem) -> Void = { _ in fatalError() }
    func openIssueDetail(withItem item: IssueItem) {
        openIssueDetailAction(item)
    }
}

@testable import issueViewer

final class IssueDetailCoordinatorMock: IssueDetailCoordinating {
    var openAction: (String) -> Void = { _ in fatalError() }
    func open(link: String) {
        openAction(link)
    }
}

@testable import issueViewer
import XCTest

final class IssueDetailPresenterTests: XCTestCase {
    let coordinator = IssueDetailCoordinatorMock()
    let display = IssueDetailDisplayMock()
    lazy var presenter: IssueDetailPresenter = {
        let presenter = IssueDetailPresenter(coordinator: coordinator)
        presenter.display = display
        return presenter
    }()
    
    func test_presentItem_shouldCallDisplayItem_withCorrectValue() {
        var receivedViewModel: IssueDetailViewModel?
        let expectedViewModel: IssueDetailViewModel = .fixture(
            user: .init(imagePath: "avatarURL", name: "login"), 
            issue: .init(title: "title", description: "body")
        )
        display.displayItemAction = { viewModel in
            receivedViewModel = viewModel
        }
        
        presenter.present(item: .fixture())
        
        XCTAssertEqual(receivedViewModel, expectedViewModel)
    }
    
    func test_presentIssueLink_shouldCallOpenLink_withCorrectValue() {
        var receivedLink: String?
        coordinator.openAction = { link in
            receivedLink = link
        }
        
        presenter.presentIssueLink(path: "dummy")
        
        XCTAssertEqual(receivedLink, "dummy")
    }
}

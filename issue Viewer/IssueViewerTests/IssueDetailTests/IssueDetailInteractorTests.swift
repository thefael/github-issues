@testable import issueViewer
import XCTest

final class IssueDetailInteractorTests: XCTestCase {
    let item: IssueItem = .fixture()
    let presenter = IssueDetailPresenterMock()
    lazy var interactor = IssueDetailInteractor(item: item, presenter: presenter)
    
    func test_loadData_shouldCallPesentItem_withCorrectValue() {
        var receivedItem: IssueItem?
        presenter.presentItemAction = { item in 
            receivedItem = item
        }
        
        interactor.loadData()
        
        XCTAssertEqual(receivedItem, item)
    }
    
    func test_didTapIssueLink_shouldCallPresentIssueLink_withCorrectvalue() {
        var receivedLink: String?
        presenter.presentIssueLinkAction = { link in
            receivedLink = link
        }
        
        interactor.didTapIssueLink()
        
        XCTAssertEqual(receivedLink, item.htmlURL)
    }
}

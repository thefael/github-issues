@testable import issueViewer
import XCTest

final class IssuesInteractorTests: XCTestCase {
    let service = URLSessionServiceMock<[IssueItem]>()
    let presenter = IssuesPresenterMock()
    lazy var interactor = IssuesInteractor(presenter: presenter, service: service)
    
    func test_loadData_whenResultIsSuccess_shouldCallPresentItems_withCorrectValues() {
        var receivedItems: [IssueItem]?
        presenter.presentItemsAction = { items in
            receivedItems = items
        }
        interactor.loadData(fromURL: URL(string: "dummyURL")!)
        
        service.fetchDataArgs?.completion(.success([.fixture()]))
        
        XCTAssertEqual([.fixture()], receivedItems)
    }
    
    func test_didTapCell_shouldCallPresentIssueDetail_withCorrectValue() {
        var receivedItem: IssueItem?
        presenter.presentIssueDetailAction = { item in 
            receivedItem = item
        }
        interactor.items = [.fixture()]
        
        interactor.didTapCell(atPosition: 0)
        
        XCTAssertEqual(receivedItem, .fixture())
    }
    
}

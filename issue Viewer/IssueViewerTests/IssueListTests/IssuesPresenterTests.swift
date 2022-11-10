@testable import issueViewer
import XCTest

final class IssuesPresenterTests: XCTestCase {
    let display = IssueListDisplayMock()
    let coordinator = IssueListCoordinatorMock()
    lazy var presenter = IssuesPresenter(coordinator: coordinator)
    
    func test_presentItems_shouldCallDisplay_withCorrectValues() {
        var receivedViewModels: [IssueViewModel]?
        display.displayItemsAction = { viewModels in 
            receivedViewModels = viewModels
        }
        presenter.display = display
        let item: IssueItem = .fixture(state: .open)
        let expectedViewModel: IssueViewModel = .init(
            title: item.title, 
            state: item.state.rawValue, 
            colors: .openColors
        )
        
        presenter.present(items: [item])
        
        XCTAssertEqual(receivedViewModels, [expectedViewModel])
    }
    
    func test_presentIssueDetail_shouldCallOpenIssueDetail_withCorrectValue() {
        var receivedItem: IssueItem?
        coordinator.openIssueDetailAction = { item in
            receivedItem = item
        }
        
        presenter.presentIssueDetail(forItem: .fixture())
        
        XCTAssertEqual(receivedItem, .fixture())
    }
}

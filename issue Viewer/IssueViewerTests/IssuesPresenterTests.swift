@testable import issueViewer
import XCTest

final class IssuesPresenterTests: XCTestCase {
    func test_presentItems_shouldCallDisplay_withCorrectValues() {
        let display = IssueListDisplayMock()
        var receivedViewModels: [IssueViewModel]?
        display.displayItemsAction = { viewModels in 
            receivedViewModels = viewModels
        }
        let presenter = IssuesPresenter()
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
}

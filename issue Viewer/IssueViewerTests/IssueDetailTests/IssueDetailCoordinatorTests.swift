@testable import issueViewer
import XCTest

final class IssueDetailCoordinatorTests: XCTestCase {
    let application = URLOpenerProtocolMock()
    lazy var coordinator = IssueDetailCoordinator(application: application)
    
    func test_openLink_shouldCall() {
        var receivedURL: URL?
        application.openAction = { url, _, _ in 
            receivedURL = url
        }
        
        coordinator.open(link: "dummy")
        
        XCTAssertEqual(receivedURL, URL(string: "dummy")!)
    }
}

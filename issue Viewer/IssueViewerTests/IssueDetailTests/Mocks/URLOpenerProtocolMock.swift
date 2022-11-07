@testable import issueViewer
import UIKit

final class URLOpenerProtocolMock: URLOpenerProtocol {
    var canOpenURLAction: (URL) -> Bool = { _ in fatalError() }
    var openAction: (URL, [UIApplication.OpenExternalURLOptionsKey: Any], ((Bool) -> Void)?) -> Void = { _, _, _ in fatalError() }
    func canOpenURL(_ url: URL) -> Bool {
        canOpenURLAction(url)
    }
    
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completionHandler completion: ((Bool) -> Void)?) {
        openAction(url, options, completion)
    }
}

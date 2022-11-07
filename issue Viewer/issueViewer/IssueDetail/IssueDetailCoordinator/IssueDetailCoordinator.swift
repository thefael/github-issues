import UIKit

protocol IssueDetailCoordinating {
    func open(link: String)
}

final class IssueDetailCoordinator: IssueDetailCoordinating {
    private let application: URLOpenerProtocol
    
    init(application: URLOpenerProtocol) {
        self.application = application
    }
    
    func open(link: String) {
        guard let url = URL(string: link) else { return }
        application.open(url, options: [:], completionHandler: nil)
    }
}

protocol URLOpenerProtocol {
    func canOpenURL(_ url: URL) -> Bool
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completionHandler completion: ((Bool) -> Void)?)
}

extension UIApplication: URLOpenerProtocol { }

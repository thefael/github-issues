import UIKit

protocol IssueDetailDisplaying: AnyObject {
    func display(item: IssueDetailViewModel)
}

final class IssueDetailViewController: UIViewController {
    private let interactor: IssueDetailInteracting
    private let issueDetailView = IssueDetailView()
    
    init(interactor: IssueDetailInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = issueDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadData()
    }
}

extension IssueDetailViewController: IssueDetailDisplaying {
    func display(item: IssueDetailViewModel) {
        issueDetailView.setupDetails(with: item)
    }
}

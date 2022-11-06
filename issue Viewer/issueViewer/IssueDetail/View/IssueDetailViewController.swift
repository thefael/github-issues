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
        issueDetailView.backgroundColor = .backgroundColor
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = issueDetailView
        issueDetailView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadData()
        navigationItem.largeTitleDisplayMode = .never
    }
}

extension IssueDetailViewController: IssueDetailDisplaying {
    func display(item: IssueDetailViewModel) {
        issueDetailView.setupDetails(with: item)
    }
}

extension IssueDetailViewController: IssueDetailViewDelegate {
    func didTapIssueLink() {
        interactor.didTapIssueLink()
    }
}

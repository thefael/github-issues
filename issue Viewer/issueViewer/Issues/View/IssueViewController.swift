import UIKit

protocol IssueListDisplaying: AnyObject {
    func display(items: [IssueViewModel])
}

final class IssueListViewController: UIViewController {
    private let interactor: IssuesInteracting
    let dataSource = TableViewDataSource<IssueViewModel, IssueCell>()
    lazy var issueListView: IssueListView = {
        let view = IssueListView()
        view.tableView.dataSource = dataSource
        return view
    }()
    
    override func loadView() {
        view = issueListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadData(fromURL: .githubIssues)
        dataSource.configureCell = { cell, viewModel in
            cell.configureCell(with: viewModel)
        }
    }
    
    init(interactor: IssuesInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension IssueListViewController: IssueListDisplaying {
    func display(items: [IssueViewModel]) {
        dataSource.items = items
        DispatchQueue.main.async {
            self.issueListView.tableView.reloadData()
        }
    }
}

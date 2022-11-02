import UIKit

final class IssueListViewController: UIViewController {
    let dataSource = TableViewDataSource<String, IssueCell>()
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
        dataSource.items = ["teste", "teste2", "teste3"]
        dataSource.configureCell = { cell, text in
            cell.configureCell(with: text)
        }
    }
}

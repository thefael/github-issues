import UIKit
import SnapKit

final class IssueListView: UIView {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(IssueCell.self, forCellReuseIdentifier: IssueCell.identifier)
        tableView.separatorColor = .separatorColor

        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension IssueListView {
    func setupConstraints() {
        addSubview(tableView)
        tableView.snp.makeConstraints { 
            $0.edges.equalToSuperview()
        }
    }
}

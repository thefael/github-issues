import UIKit

final class IssueCell: UITableViewCell {
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var stateTag: TagView = {
        let tag = TagView()
        return tag
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabelConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func configureCell(with text: String) {
        descriptionLabel.text = text
    }
    
    private func setupLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

extension UITableViewCell {
    static var identifier: String = String(describing: UITableViewCell.self)
}

final class TagView: UIView {
    // TODO: build tagView
}

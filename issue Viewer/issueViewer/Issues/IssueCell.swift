import UIKit

final class IssueCell: UITableViewCell {
    fileprivate enum Layout { }
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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
    // TODO: add snapkit pod
    private func setupLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Layout.descriptionPadding.top).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Layout.descriptionPadding.leading).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Layout.descriptionPadding.bottom).isActive = true
    }
}

extension IssueCell.Layout {
    static var descriptionPadding: (top: CGFloat, leading: CGFloat, trailing: CGFloat, bottom: CGFloat) = (20, 50, 0, -20)
}

extension UITableViewCell {
    static var identifier: String = String(describing: UITableViewCell.self)
}

final class TagView: UIView {
    // TODO: build tagView
}

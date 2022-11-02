import UIKit
import SnapKit

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
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { 
            $0.top.equalToSuperview().offset(Layout.descriptionPadding.top)
            $0.leading.equalToSuperview().offset(Layout.descriptionPadding.leading)
            $0.trailing.equalToSuperview().offset(Layout.descriptionPadding.leading)
            $0.bottom.equalToSuperview().offset(Layout.descriptionPadding.bottom)
        }
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

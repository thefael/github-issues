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
        tag.setText(text: "testezão", font: .systemFont(ofSize: 12, weight: .bold), color: .white)
        tag.setBackgroundColor(.red)
        return tag
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stateTag, descriptionLabel])
        view.axis = .vertical
        view.alignment = .leading
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func configureCell(with text: String) {
        descriptionLabel.text = text
    }
    
    private func setupConstraints() {
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Layout.stackPadding.top)
            $0.leading.equalToSuperview().offset(Layout.stackPadding.leading)
            $0.trailing.equalToSuperview().offset(Layout.stackPadding.leading)
            $0.bottom.equalToSuperview().offset(Layout.stackPadding.bottom)
        }
    }
}

extension IssueCell.Layout {
    static var stackPadding: (top: CGFloat, leading: CGFloat, trailing: CGFloat, bottom: CGFloat) = (20, 50, 0, -20)
}

extension UITableViewCell {
    static var identifier: String = String(describing: UITableViewCell.self)
}

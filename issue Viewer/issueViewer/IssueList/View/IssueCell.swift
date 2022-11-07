import UIKit
import SnapKit

final class IssueCell: UITableViewCell {
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .textColor
        return label
    }()
    
    private var stateTag: TagView = {
        let tag = TagView()
        return tag
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stateTag, descriptionLabel])
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .leading
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addCustomDisclosureIndicator(with: .textColor)
        setupConstraints()
        backgroundColor = .backgroundColor
        let backgroundView = UIView()
        backgroundView.backgroundColor = .selectedColor
        selectedBackgroundView = backgroundView
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func configureCell(with viewModel: IssueViewModel) {
        descriptionLabel.text = viewModel.title
        stateTag.setText(
            text: viewModel.state, 
            font: .systemFont(ofSize: 12, weight: .bold)
        )
        stateTag.setColors(colors: viewModel.colors)
    }
    
    private func setupConstraints() {
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Layout.stackPadding.top)
            $0.leading.equalToSuperview().offset(Layout.stackPadding.leading)
            $0.trailing.equalToSuperview().offset(Layout.stackPadding.trailing)
            $0.bottom.equalToSuperview().offset(Layout.stackPadding.bottom)
        }
    }
    
    private enum Layout {
        static var stackPadding: (top: CGFloat, leading: CGFloat, trailing: CGFloat, bottom: CGFloat) = (15, 20, -10, -10)
    }
}

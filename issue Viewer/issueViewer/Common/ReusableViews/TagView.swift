import UIKit
import SnapKit

final class TagView: UIView {
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func setText(text: String, font: UIFont) {
        label.text = text
        label.font = font
    }
    
    func setColors(colors: Colors) {
        backgroundColor = colors.background
        label.textColor = colors.title
        setupBorder(withColor: colors.border.cgColor)
    }
    
    private func setupBorder(withColor color: CGColor) {
        layer.borderWidth = 2
        layer.cornerRadius = 12
        layer.borderColor = color
    }
    
    private func setupConstraints() {
        addSubview(label)
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Layout.topPadding)
            $0.bottom.equalToSuperview().offset(Layout.bottomPadding)
            $0.leading.equalToSuperview().offset(Layout.leadingPadding)
            $0.trailing.equalToSuperview().offset(Layout.trailingPadding)
        }
    }
    
    private enum Layout {
        static var topPadding: CGFloat = 5
        static var leadingPadding: CGFloat = 10
        static var trailingPadding: CGFloat = -10
        static var bottomPadding: CGFloat = -5
    } 
}

extension TagView {
    struct Colors: Equatable {
        let background: UIColor
        let title: UIColor
        let border: UIColor
        
        static let openColors = TagView.Colors(
            background: .backgroundColor, 
            title: .openColor, 
            border: .openColor
        )
        
        static let closedColors = TagView.Colors(
            background: .backgroundColor,
            title: .closedColor,
            border: .closedColor
        )
    }
}

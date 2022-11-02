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
    
    func setText(text: String, font: UIFont, color: UIColor) {
        label.text = text
        label.font = font
        label.textColor = color
    }
    
    func setBackgroundColor(_ color: UIColor) {
        backgroundColor = color
        layer.cornerRadius = 12
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

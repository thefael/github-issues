import UIKit
import SnapKit

final class IssueDetailView: UIView {
    private let userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        let image = UIImage(systemName: "star.fill")
        imageView.image = image
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.text = "username"
        return label
    }()
    
    private lazy var userStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userImage, userName])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        stack.sizeToFit()
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "teste"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "teste descrição"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .white
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    private func setupConstraints() {
        setupStackConstraints()
        setupTitleConstraints()
        setupDescriptionConstraints()
    }
    
    private func setupStackConstraints() {
        addSubview(userStack)
        userStack.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(8)
            $0.leading.equalToSuperview().offset(16)
        }
    }
    
    private func setupTitleConstraints() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(userStack.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    private func setupDescriptionConstraints() {
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
}

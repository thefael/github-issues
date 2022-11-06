import UIKit
import SnapKit

final class IssueDetailView: UIView {
    private let userImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.rounded()
        return imageView
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
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
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .white
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func setupDetails(with viewModel: IssueDetailViewModel) {
        titleLabel.text = viewModel.issue.title
        descriptionLabel.text = viewModel.issue.description
        userName.text = viewModel.user.name
        userImage.image = viewModel.user.image
    }
    
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
        userImage.snp.makeConstraints { 
            $0.size.equalTo(CGSize(width: 50, height: 50))
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

extension UIImageView {
   func rounded() {
       let radius = self.frame.width / 2
       self.layer.cornerRadius = radius
       self.layer.masksToBounds = false
       self.clipsToBounds = true
   }
}

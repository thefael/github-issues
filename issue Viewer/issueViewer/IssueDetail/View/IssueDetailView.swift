import UIKit
import SnapKit

protocol IssueDetailViewDelegate: AnyObject {
    func didTapIssueLink()
}

final class IssueDetailView: UIView {
    private let userImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: Layout.userImageSize.width, height: Layout.userImageSize.height))
        imageView.rounded()
        return imageView
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        return label
    }()
    
    private lazy var userStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userImage, userName])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = Layout.stackSpacing
        stack.sizeToFit()
        return stack
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .separatorColor
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .textColor
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .textColor
        return label
    }()
    
    private let issueLinkButton: UIButton = {
        let button = UIButton()
        let attributedString = NSAttributedString(string: NSLocalizedString("open with GitHub", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12.0),
            NSAttributedString.Key.foregroundColor: UIColor.systemBlue,
            NSAttributedString.Key.underlineStyle: 1.0
        ])
        button.setAttributedTitle(attributedString, for: .normal)
        button.addTarget(self, action: #selector(didTapIssueLink), for: .touchUpInside)
        return button
    }()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let issueLink: String = ""
    weak var delegate: IssueDetailViewDelegate?
    
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
        loadUserImage(path: viewModel.user.imagePath)
    }
    
    private func setupConstraints() {
        setupViews()
        setupStackConstraints()
        setupTitleConstraints()
        setupSeparatorView()
        setupDescriptionConstraints()
        setupButtonConstraint()
    }
    
    private func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { 
            $0.edges.width.equalToSuperview()
        }
    }
    
    private func setupStackConstraints() {
        contentView.addSubview(userStack)
        userStack.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Layout.topSpacing)
            $0.leading.equalToSuperview().offset(Layout.leftSpacing)
        }
        userImage.snp.makeConstraints { 
            $0.size.equalTo(Layout.userImageSize)
        }
    }
    
    private func setupTitleConstraints() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(userStack.snp.bottom).offset(Layout.topSpacing)
            $0.leading.equalToSuperview().offset(Layout.leftSpacing)
            $0.trailing.equalToSuperview().offset(Layout.rightSpacing)
        }
    }
    
    private func setupSeparatorView() {
        contentView.addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(Layout.topSpacing)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(Layout.separatorViewSize)
        }
    }
    
    private func setupDescriptionConstraints() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(Layout.topSpacing)
            $0.leading.equalToSuperview().offset(Layout.leftSpacing)
            $0.trailing.equalToSuperview().offset(Layout.rightSpacing)
        }
    }
    
    private func setupButtonConstraint() {
        contentView.addSubview(issueLinkButton)
        issueLinkButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(Layout.topSpacing)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func loadUserImage(path: String) {
        DispatchQueue.global().async {
            guard let url = URL(string: path), let data = try? Data(contentsOf: url) else { 
                DispatchQueue.main.async {
                    self.userImage.image = UIImage(named: "star.fill") ?? .init()
                }
                return 
            }
            DispatchQueue.main.async {
                self.userImage.image = UIImage(data: data) 
            }
        }
    }
    
    @objc
    func didTapIssueLink() {
        delegate?.didTapIssueLink()
    }
    
    private enum Layout {
        static let separatorViewSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 1)
        static let leftSpacing: CGFloat = 16
        static let rightSpacing: CGFloat = -16
        static let topSpacing: CGFloat = 8
        static let userImageSize: CGSize = .init(width: 50, height: 50)
        static let stackSpacing: CGFloat = 10
    }
}

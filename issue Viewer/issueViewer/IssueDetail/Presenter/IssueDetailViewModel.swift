struct IssueDetailViewModel: Equatable {
    let user: User
    let issue: Issue
    
    struct User: Equatable {
        let imagePath: String
        let name: String
    }
    
    struct Issue: Equatable {
        let title: String
        let description: String
    }
}

extension IssueDetailViewModel {
    static func fixture(
        user: User = .fixture(),
        issue: Issue = .fixture()
    ) -> IssueDetailViewModel {
        .init(
            user: user, 
            issue: issue
        )
    }
}

extension IssueDetailViewModel.User {
    static func fixture(
        imagePath: String = "imagePath",
        name: String = "name"
    ) -> IssueDetailViewModel.User {
        .init(
            imagePath: imagePath,
            name: name
        )
    }
}

extension IssueDetailViewModel.Issue {
    static func fixture(
        title: String = "title",
        description: String = "description"
    ) -> IssueDetailViewModel.Issue {
        .init(
            title: title,
            description: description
        )
    }
}

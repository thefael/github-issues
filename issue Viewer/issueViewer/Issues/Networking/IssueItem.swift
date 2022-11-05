struct IssueItem: Decodable, Equatable {
    let title: String
    let state: IssueState
    let body: String?
    let user: GithubUser
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case state
        case body
        case user
        case createdAt = "created_at"
    }
}

enum IssueState: String, Decodable, Equatable {
    case open
    case closed
}

struct GithubUser: Decodable, Equatable {
    let login: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}

extension IssueItem {
    static func fixture(
        title: String = "title",
        state: IssueState = .open,
        body: String = "body",
        user: GithubUser = .fixture(),
        createdAt: String = "createdAt"
    ) -> IssueItem {
        .init(
            title: title, 
            state: state,
            body: body, 
            user: user, 
            createdAt: createdAt 
        )
    }
}

extension GithubUser {
    static func fixture(
        login: String = "login",
        avatarURL: String = "avatarURL"
    ) -> GithubUser {
        .init(
            login: login,
            avatarURL: avatarURL
        )
    }
}

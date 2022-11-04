struct IssueItem: Decodable, Equatable {
    let title: String
    let state: IssueState
}

enum IssueState: String, Decodable, Equatable {
    case open
    case closed
}

extension IssueItem {
    static func fixture(
        title: String = "title",
        state: IssueState = .open
    ) -> IssueItem {
        .init(
            title: title, 
            state: state
        )
    }
}

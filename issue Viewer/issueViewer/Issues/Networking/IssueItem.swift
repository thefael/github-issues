struct IssueItem: Decodable {
    let title: String
    let state: IssueState
}

enum IssueState: String, Decodable {
    case open
    case closed
}

import UIKit

struct IssueViewModel {
    let title: String
    let state: Tag
}

struct Tag {
    let text: String
    let textColor: UIColor
    let backgoundColor: UIColor
}

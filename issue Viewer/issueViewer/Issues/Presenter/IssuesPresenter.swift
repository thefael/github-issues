import Foundation
import UIKit

protocol IssuesPresenting {
    func present(items: [IssueItem])
}

final class IssuesPresenter { 
    weak var display: IssueListDisplaying?
}

extension IssuesPresenter: IssuesPresenting {
    func present(items: [IssueItem]) {
        let viewModels = items.map { 
            IssueViewModel(
                title: $0.title, 
                state: .init(
                    text: $0.state.rawValue, 
                    textColor: .white, 
                    backgoundColor: .darkGray
                )
            ) 
        }
        display?.display(items: viewModels)
    }
}

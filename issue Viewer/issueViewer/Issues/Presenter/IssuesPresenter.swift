import Foundation
import UIKit

protocol IssuesPresenting {
    func present(items: [IssueItem])
    func presentIssueDetail(forItem item: IssueItem)
}

final class IssuesPresenter { 
    private let coordinator: IssueListCoordinating
    weak var display: IssueListDisplaying?
    
    init(coordinator: IssueListCoordinating) {
        self.coordinator = coordinator
    }
}

extension IssuesPresenter: IssuesPresenting {
    func present(items: [IssueItem]) {
        let viewModels = items.map { 
            IssueViewModel(
                title: $0.title, 
                state: $0.state.rawValue,
                colors: $0.state == .open ? .openColors : .closedColors
            ) 
        }
        display?.display(items: viewModels)
    }
    
    func presentIssueDetail(forItem item: IssueItem) {
        coordinator.openIssueDetail(withItem: item)
    }
}

import UIKit

final class TableViewDataSource<T: Decodable, Cell: UITableViewCell>: NSObject, UITableViewDataSource {
    var items: [T]?
    var configureCell: ((Cell, T) -> Void)?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell, 
                let item = items?[indexPath.row] else { return UITableViewCell() }
        configureCell?(cell, item)
        
        return cell
    }
}

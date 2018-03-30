

import Foundation
import UIKit

class BookListsViewController: UIViewController {
    
    private let model = BookListsModel()
    
    override func loadView() {
        self.view = BookListsView()
    }
    
    override func viewDidLoad() {
        let listsView = self.view as! BookListsView
        listsView.tableView.delegate = self
        listsView.tableView.dataSource = model
    }
    
}


extension BookListsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = model.bookLists[indexPath.row]
        let vc = BookDetailViewController(data: selectedItem)
        present(vc, animated: true, completion: nil)
    }
    
}

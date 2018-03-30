

import Foundation
import UIKit

class BookListsViewController: UIViewController {
    
    private let model = BookListsModel()
//    private lazy var backBarcodeReaderButton: UIBarButtonItem = {
//        let button = UIBarButtonItem(image: UIImage(named: "ic_clear"), style: .done, target: self, action: #selector(backBarcodeReader))
//        return button
//    }()
    
    override func loadView() {
        self.view = BookListsView()
    }
    
    override func viewDidLoad() {
        let listsView = self.view as! BookListsView
        listsView.tableView.delegate = self
        listsView.tableView.dataSource = model
        listsView.barcodeReaderButton.addTarget(self, action: #selector(backBarcodeReader), for: .touchUpInside)
        
        navigationItem.title = "Book List"
//        navigationItem.leftBarButtonItem = backBarcodeReaderButton
    }
    
    @objc private func backBarcodeReader() {
        dismiss(animated: true, completion: nil)
    }
    
}


extension BookListsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = model.bookLists[indexPath.row]
        let vc = BookDetailViewController(data: selectedItem)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

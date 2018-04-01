

import Foundation
import UIKit

class BookListsViewController: UIViewController {
    
    private var listsView: BookListsView!
    private let model = BookListsModel()
//    private lazy var backBarcodeReaderButton: UIBarButtonItem = {
//        let button = UIBarButtonItem(image: UIImage(named: "ic_clear"), style: .done, target: self, action: #selector(backBarcodeReader))
//        return button
//    }()
    
    override func loadView() {
        self.view = BookListsView()
    }
    
    override func viewDidLoad() {
        listsView = self.view as! BookListsView
        listsView.tableView.delegate = self
        listsView.tableView.dataSource = model
        listsView.barcodeReaderButton.addTarget(self, action: #selector(backBarcodeReader), for: .touchUpInside)
        
        navigationItem.title = "Book List"
//        navigationItem.leftBarButtonItem = backBarcodeReaderButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        listsView.barcodeReaderButton.alpha = 0.0
        listsView.barcodeReaderButton.transform = CGAffineTransform(translationX: 100, y: 100)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        toggleBarcodeButton(shouldPresent: true)
    }
    
    @objc private func backBarcodeReader() {
        toggleBarcodeButton(shouldPresent: false, dismiss: true)
    }
    
    private func toggleBarcodeButton(shouldPresent: Bool, dismiss: Bool = false) {
        if shouldPresent {
            listsView.barcodeReaderButton.alpha = 1.0
            UIView.animate(withDuration: 0.3) {
                self.listsView.barcodeReaderButton.transform = .identity
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.listsView.barcodeReaderButton.transform = CGAffineTransform(translationX: 100, y: 100)
                self.listsView.barcodeReaderButton.alpha = 0.0
            }) { _ in
                if dismiss {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
}


extension BookListsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = model.bookLists[indexPath.row]
        let vc = BookDetailViewController(data: selectedItem)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.toggleBarcodeButton(shouldPresent: false)
//        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.toggleBarcodeButton(shouldPresent: true)
        }
    }
    
//    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
//        toggleBarcodeButton(shouldPresent: false)
//    }
//
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        toggleBarcodeButton(shouldPresent: true)
//    }
    
}

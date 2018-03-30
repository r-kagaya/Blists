
import UIKit
import Alamofire
import SwiftyJSON

class QRReaderViewController: UIViewController {

    override func loadView() {
        self.view = QRReaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let qrReaderView = self.view as! QRReaderView
        qrReaderView.listButton.addTarget(self, action: #selector(showList), for: .touchUpInside)
        qrReaderView.delegate = self
    }

    @objc private func showList() {
        let vc = BookListsViewController()
        present(vc, animated: true, completion: nil)
        
    }

}

extension QRReaderViewController: barcodeReaderDelegate {
    func didDetection(isbn: String) {
        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)&Country=JP") else { return }
        Alamofire.request(url)
            .responseJSON { response in
//                defer {
//                    if let handler = handler {
//                        handler()
//                    }
//                }
                switch response.result {
                case .success(let responseValue):
                    let json = JSON(responseValue)
                    let book = Book(json)
                    BookLists.registrerBookList(books: book)
                    Alert(title: "読み込み完了しました", message: "読み込み完了しました")
                        .addAction(title: "OK", style: .default) { (action) in
                            let view = self.view as! QRReaderView
                            view.start()
                        }
                        .open()

                case .failure(let error):
                    print(error)
                }
        }
    }
}






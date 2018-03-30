
import UIKit
import Alamofire
import SwiftyJSON

class QRReaderViewController: UIViewController {

    private var qrReaderView: QRReaderView!
    override func loadView() {
        self.view = QRReaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        qrReaderView = self.view as! QRReaderView
        qrReaderView.listButton.addTarget(self, action: #selector(showList), for: .touchUpInside)
        qrReaderView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        qrReaderView.listButton.alpha = 0.0
        qrReaderView.listButton.transform = CGAffineTransform(translationX: 100, y: 65)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        qrReaderView.listButton.alpha = 1.0
        UIView.animate(withDuration: 0.3) {
            self.qrReaderView.listButton.transform = .identity
        }
    }

    @objc private func showList() {
        let vc = UINavigationController(rootViewController: BookListsViewController())
        vc.modalTransitionStyle = .flipHorizontal
        UIView.animate(withDuration: 0.3, animations: {
            self.qrReaderView.listButton.transform = CGAffineTransform(translationX: 100, y: 65)
            self.qrReaderView.listButton.alpha = 0.0
        }) { _ in
            self.present(vc, animated: true)
        }
    }

}

extension QRReaderViewController: barcodeReaderDelegate {
    func didDetection(isbn: String) {
        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)&Country=JP") else { return }
        print(url)
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






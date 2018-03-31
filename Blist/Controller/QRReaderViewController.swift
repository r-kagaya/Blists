
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
        qrReaderView.listButton.transform = CGAffineTransform(translationX: 100, y: 100)
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
            self.qrReaderView.listButton.transform = CGAffineTransform(translationX: 100, y: 100)
            self.qrReaderView.listButton.alpha = 0.0
        }) { _ in
            self.present(vc, animated: true)
        }
    }
    
    private func resultAlert(title: String, message: String) {
        Alert(title: title, message: message)
            .addAction(title: "OK", style: .default) { (action) in
                let view = self.view as! QRReaderView
                view.start()
            }
            .open()
    }

}

extension QRReaderViewController: barcodeReaderDelegate {
    func didDetection(isbn: String) {
        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)&Country=JP") else { return }
        print(url)
        Alamofire.request(url)
            .responseJSON { response in
                switch response.result {
                case .success(let responseValue):
                    var alertTitle = "読み込みに失敗しました"
                    var alertMessage = "もう一度読み込んで下さい"
                    
                    defer {
                        self.resultAlert(title: alertTitle, message: alertMessage)
                    }
                    
                    let json = JSON(responseValue)
                    
                    guard let kind = json["kind"].string, kind.contains("books#volumes") else {
                        alertTitle = "バーコードが違います"
                        return
                    }
     
                    guard let totalItems = json["totalItems"].int, totalItems != 0 else {
                        print("ijjiojijijo")
                        alertTitle = "見つかりませんでした"
                        return
                    }
                    
                    let book = Book(json)
                    BookLists.registrerBookList(books: book)
                    alertTitle = "読み込みに成功しました"
                    alertMessage = "リストに追加されました"

                case .failure(let error):
                    print(error)
                }
        }
    }
}






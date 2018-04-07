

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class BookDetailViewController: UIViewController {
    
    private let model: BookDetailModel!
    override func loadView() {
        self.view = BookDetailView()
    }
    
    required init(data: BookLists) {
        self.model = BookDetailModel(data: data)
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false

        let detailView = self.view as! BookDetailView

        detailView.titleLabel.text = model.book.title
        detailView.subtitleLabel.text = model.book.subTitle
        detailView.descTextView.text = model.book.explanation
        detailView.buyRakutenButton.addTarget(self, action: #selector(openRakutenApp), for: .touchUpInside)
        detailView.buyAmazonButton.addTarget(self, action: #selector(openAmazonApp), for: .touchUpInside)
        
        guard let url = URL(string: model.book.imageLink) else { return }
        Alamofire.request(url)
            .responseData { response in
                switch response.result {
                case .success(let responseValue):
                    detailView.bookImageView.image = UIImage(data: responseValue, scale: 1.0)

                case .failure(let error):
                    print(error)
                }
        }
    }
    
    private func convertToISBN10(ISBN13 isbn13: String) -> String {
        
        let _isbn10 = isbn13[isbn13.index(isbn13.startIndex, offsetBy: 3)..<isbn13.index(isbn13.startIndex, offsetBy: isbn13.count - 1)]
        
        var degitCount = 10
        var _isbn13AllSum: Int = 0
        _isbn10.forEach { num in
            let code = Int(String(num))! * degitCount
            _isbn13AllSum = _isbn13AllSum + code
            degitCount = degitCount - 1
        }
        var _isbn13checkDegit = 11 - (_isbn13AllSum % 11)
        if _isbn13checkDegit == 11 {
            _isbn13checkDegit = 0
        }

        return String(_isbn10) + String(_isbn13checkDegit)
    }
    
    @objc private func openAmazonApp() {
        let url = URL(string: "http://www.amazon.co.jp/dp/\(self.convertToISBN10(ISBN13: self.model.book.ISBN))")!
    //                let appScheme = URL(string: "com.amazon.mobile.shopping://")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func openRakutenApp() {
        let url = URL(string: model.book.itemUrl)!
    //                let appScheme = URL(string: "Rakuten://")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
}

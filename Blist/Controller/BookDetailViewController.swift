

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
        detailView.buyButton.addTarget(self, action: #selector(presentBuyActionSheet), for: .touchUpInside)
        
        let ratingLabel = UILabel(frame: .zero)
        ratingLabel.text = model.book.reviewAverage
        ratingLabel.textAlignment = .center
        
        let priceLabel = UILabel(frame: .zero)
        priceLabel.text = String(model.book.itemPrice) + "円"
        priceLabel.textAlignment = .center
        
        let authorLabel = UILabel(frame: .zero)
        authorLabel.text = model.book.authors
        authorLabel.adjustsFontSizeToFitWidth = true
        authorLabel.textAlignment = .center
        
        detailView.infoStackView.addArrangedSubview(ratingLabel)
        detailView.infoStackView.addArrangedSubview(priceLabel)
        detailView.infoStackView.addArrangedSubview(authorLabel)

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
    
    @objc private func presentBuyActionSheet() {
        Alert(title: "購入先を選んで下さい", message: "購入先を選んで、購入を完了させましょう", style: .actionSheet)
        .addAction(title: "Yahooショッピング", style: .default) { _ in
            self.openYahooShop()
        }
        .addAction(title: "Amazon", style: .default) { _ in
            self.openAmazonApp()
        }
        .addAction(title: "楽天", style: .default) { _ in
            self.openRakutenApp()
        }
        .addAction(title: "キャンセル", style: .cancel)
        .open()
    }
    
    private func openAmazonApp() {
        let url = URL(string: "http://www.amazon.co.jp/dp/\(self.convertToISBN10(ISBN13: self.model.book.ISBN))")!
    //                let appScheme = URL(string: "com.amazon.mobile.shopping://")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    private func openRakutenApp() {
        let url = URL(string: model.book.itemUrl)!
    //                let appScheme = URL(string: "Rakuten://")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    private func openYahooShop() {
        let url = URL(string: "https://shopping.yahoo.co.jp/search?first=&p=\(self.model.book.ISBN)")!
        //                let appScheme = URL(string: "Rakuten://")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
}

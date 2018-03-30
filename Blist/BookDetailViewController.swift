

import Foundation
import UIKit

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
        let detailView = self.view as! BookDetailView
        detailView.titleLabel.text = model.book.title
        detailView.subtitleLabel.text = model.book.subTitle
        detailView.authorLabel.text = model.book.authors[0]
        detailView.publishedDateLabel.text = model.book.publishedDate
        detailView.pageCountLabel.text = String(model.book.pageCount)
        detailView.explanationArea.text = model.book.explanation
    
    }
    
}


import UIKit

class BookDetailCardView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var pageCountLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var bookImageView: UIImageView!
    
    /** イニシャライザー */
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadFromNib()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadFromNib()
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        descTextView.setContentOffset(.zero, animated: false)
    }

    /** Nibファイル読み込み */
    private func loadFromNib() {
        let view = Bundle.main.loadNibNamed("BookDetailCardView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds

        self.addSubview(view)
        
        // カスタムViewのサイズを自分自身と同じサイズにする
        view.translatesAutoresizingMaskIntoConstraints = false
        let constraints1 = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[view]-0-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: ["view" : view]
        )
        self.addConstraints(constraints1)
        
        let constraints2 = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[view]-0-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: ["view" : view]
        )
        self.addConstraints(constraints2)
    }
    
}

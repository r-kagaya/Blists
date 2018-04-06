
import Foundation
import UIKit

class BookDetailView: UIView {
    
    lazy var contentsCardView: BookDetailCardView = {
        let card = BookDetailCardView(frame: .zero)
        return card
    }()
    
//    @IBOutlet weak var subtitleLabel: UILabel!
//    @IBOutlet weak var publishedDate: UILabel!
//    @IBOutlet weak var authorLabel: UILabel!
//    @IBOutlet weak var pageCountLabel: UILabel!
//    @IBOutlet weak var descTextView: UITextView!
//    @IBOutlet weak var bookImageView: UIImageView!
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    
    
    lazy var buyRakutenButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor.hex(hexStr: "DC2C17", alpha: 1.0)
        button.setTitle("楽天で購入", for: .normal)
        return button
    }()
    
    lazy var buyAmazonButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor.hex(hexStr: "F19E39", alpha: 1.0)
        button.setTitle("Amazonで購入", for: .normal)
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(buyRakutenButton)
        stackView.addArrangedSubview(buyAmazonButton)
        return stackView
    }()
    
    required init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(buttonStackView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        activateConstraints()
        setupButtonDesgin()
    }
    
    private func setupButtonDesgin() {
        buyRakutenButton.addShadow(.lightGray, opacity: 1.0, radius: 2.0, CGSize(width: 3, height: 3))
        buyRakutenButton.layer.cornerRadius = 20.0
        buyRakutenButton.addBorder()
        //        buyRakutenButton.layer.masksToBounds = false //角丸ではみ出した背景を切り取る
        
        buyAmazonButton.addShadow(.lightGray, opacity: 1.0, radius: 2.0, CGSize(width: 3, height: 3))
        buyAmazonButton.addBorder()
        buyAmazonButton.layer.cornerRadius = 20.0
        //        buyAmazonButton.layer.masksToBounds = false //角丸ではみ出した背景を切り取る
    }
    
    private func activateConstraints() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
        titleLabel.sizeToFit()
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        buttonStackView.widthAnchor.constraint(equalToConstant: frame.width - 50).isActive = true
        buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonStackView.spacing = 15

    }
  
    
}

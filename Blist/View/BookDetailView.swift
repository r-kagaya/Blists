
import Foundation
import UIKit

class BookDetailView: UIView {
    
//    @IBOutlet weak var subtitleLabel: UILabel!
//    @IBOutlet weak var publishedDate: UILabel!
//    @IBOutlet weak var authorLabel: UILabel!
//    @IBOutlet weak var pageCountLabel: UILabel!
//    @IBOutlet weak var descTextView: UITextView!
//    @IBOutlet weak var bookImageView: UIImageView!
    
    lazy var titlePlaceHolder: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Title"
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.italicSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descTextViewLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Description"
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    lazy var descTextView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.isEditable = false
        textView.isSelectable = false
        return textView
    }()
    
    lazy var backBlurView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.dark))
//        view.layer.position = CGPoint(x:mySegcon.bounds.midX, y:-(effectView.frame.midY + 20) )
        view.layer.masksToBounds = true
//        view.layer.cornerRadius = 20.0
        return view
    }()
    
    lazy var bookImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        return imageView
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
        addSubview(backBlurView)
        addSubview(bookImageView)
        addSubview(titlePlaceHolder)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(descTextViewLabel)
        addSubview(descTextView)
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
        buyRakutenButton.addShadow(.lightGray, opacity: 1.0, radius: 2.0, CGSize(width: 2, height: 2))
        buyRakutenButton.layer.cornerRadius = 20.0
        buyRakutenButton.addBorder()
        //        buyRakutenButton.layer.masksToBounds = false //角丸ではみ出した背景を切り取る
        
        buyAmazonButton.addShadow(.lightGray, opacity: 1.0, radius: 2.0, CGSize(width: 3, height: 3))
        buyAmazonButton.addBorder()
        buyAmazonButton.layer.cornerRadius = 20.0
        //        buyAmazonButton.layer.masksToBounds = false //角丸ではみ出した背景を切り取る
    }
    
    private func activateConstraints() {
        
        backBlurView.translatesAutoresizingMaskIntoConstraints = false
        backBlurView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backBlurView.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        backBlurView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        backBlurView.heightAnchor.constraint(equalToConstant: frame.height / 4).isActive = true

        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        bookImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookImageView.centerYAnchor.constraint(equalTo: backBlurView.centerYAnchor).isActive = true
        bookImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        bookImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        titlePlaceHolder.translatesAutoresizingMaskIntoConstraints = false
        titlePlaceHolder.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titlePlaceHolder.topAnchor.constraint(equalTo: backBlurView.bottomAnchor, constant: 10).isActive = true
        titlePlaceHolder.widthAnchor.constraint(equalToConstant: frame.width - 40).isActive = true
        titlePlaceHolder.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: titlePlaceHolder.bottomAnchor, constant: 5).isActive = true
        titleLabel.sizeToFit()
        titleLabel.widthAnchor.constraint(equalToConstant: frame.width - 40).isActive = true

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        subtitleLabel.sizeToFit()
        subtitleLabel.widthAnchor.constraint(equalToConstant: frame.width - 40).isActive = true

        descTextViewLabel.translatesAutoresizingMaskIntoConstraints = false
        descTextViewLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descTextViewLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20).isActive = true
        descTextViewLabel.widthAnchor.constraint(equalToConstant: frame.width - 50).isActive = true
        descTextViewLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        descTextView.translatesAutoresizingMaskIntoConstraints = false
        descTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descTextView.topAnchor.constraint(equalTo: descTextViewLabel.bottomAnchor, constant: 0).isActive = true
        descTextView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -30).isActive = true
        descTextView.widthAnchor.constraint(equalToConstant: frame.width - 40).isActive = true
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        buttonStackView.widthAnchor.constraint(equalToConstant: frame.width - 50).isActive = true
        buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonStackView.spacing = 15

    }
  
    
}

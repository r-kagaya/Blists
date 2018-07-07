
import Foundation
import UIKit

class BookDetailView: UIView {

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
    
    lazy var infoStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()
    
    lazy var infoLabel: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.distribution = .fillEqually
        view.spacing = 20

        let infoItems = ["レビュー", "プライス", "著者"]
        infoItems.forEach { item in
            let label = UILabel(frame: .zero)
            label.text = item
            label.textAlignment = .center
            label.textColor = .lightGray
            view.addArrangedSubview(label)
        }

        return view
    }()

    lazy var buyButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor.hex(hexStr: "52ACFF", alpha: 1.0)
        button.setTitle("購入する", for: .normal)
        return button
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
        addSubview(infoLabel)
        addSubview(infoStackView)
        addSubview(buyButton)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        activateConstraints()
        setupButtonDesgin()
    }
    
    private func setupButtonDesgin() {
        buyButton.addShadow(.lightGray, opacity: 1.0, radius: 2.0, CGSize(width: 3, height: 3))
        buyButton.addBorder()
        buyButton.layer.cornerRadius = 20.0
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
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20).isActive = true
        infoLabel.widthAnchor.constraint(equalToConstant: frame.width - 20).isActive = true
        infoLabel.sizeToFit()
        
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        infoStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10).isActive = true
        infoStackView.widthAnchor.constraint(equalToConstant: frame.width - 20).isActive = true
        infoStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: frame.width - 100).isActive = true
        buyButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        descTextViewLabel.translatesAutoresizingMaskIntoConstraints = false
        descTextViewLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descTextViewLabel.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 20).isActive = true
        descTextViewLabel.widthAnchor.constraint(equalToConstant: frame.width - 50).isActive = true
        descTextViewLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        descTextView.translatesAutoresizingMaskIntoConstraints = false
        descTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descTextView.topAnchor.constraint(equalTo: descTextViewLabel.bottomAnchor, constant: 0).isActive = true
        descTextView.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -30).isActive = true
        descTextView.widthAnchor.constraint(equalToConstant: frame.width - 40).isActive = true

    }
  
    
}

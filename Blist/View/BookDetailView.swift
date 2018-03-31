
import Foundation
import UIKit

class BookDetailView: UIView {
    
    lazy var contentsCardView: BookDetailCardView = {
        let card = BookDetailCardView(frame: .zero)
        return card
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
//        button.setImage(UIImage(named: "AmazonBuy-1"), for: .normal)
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
        addSubview(contentsCardView)
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
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        buttonStackView.widthAnchor.constraint(equalToConstant: frame.width - 50).isActive = true
        buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonStackView.spacing = 15
        
        contentsCardView.translatesAutoresizingMaskIntoConstraints = false
//        contentsCardView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        contentsCardView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentsCardView.topAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
        contentsCardView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -30).isActive = true
        contentsCardView.widthAnchor.constraint(equalToConstant: frame.width - 30).isActive = true
//        contentsCardView.heightAnchor.constraint(equalToConstant: frame.height / 1.5)
        contentsCardView.layer.cornerRadius = 10.0
    }
  
    
}

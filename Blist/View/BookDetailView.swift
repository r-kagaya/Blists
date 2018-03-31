
import Foundation
import UIKit

class BookDetailView: UIView {
    
    lazy var contentsCardView: BookDetailCardView = {
        let card = BookDetailCardView(frame: .zero)
        return card
    }()
    
    let buttonStackView = BuyButtons(arrangedSubviews: [])

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

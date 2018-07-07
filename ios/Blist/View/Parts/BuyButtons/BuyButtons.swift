
import Foundation
import UIKit

class BuyButtons: UIStackView {
    override func awakeFromNib() {
        distribution = .fillEqually
    }
    override func layoutSubviews() {
        spacing = 15
    }
}

class BuyRakutenButton: UIButton {
    
    override func awakeFromNib() {
        backgroundColor = UIColor.hex(hexStr: "DC2C17", alpha: 1.0)
        setTitle("楽天で購入", for: .normal)
        
        addShadow(.lightGray, opacity: 1.0, radius: 2.0, CGSize(width: 3, height: 3))
        layer.cornerRadius = 20.0
        addBorder()
    }
    
}

class BuyAmazonButton: UIButton {
    override func awakeFromNib() {
        backgroundColor = UIColor.hex(hexStr: "F19E39", alpha: 1.0)
        setTitle("Amazonで購入", for: .normal)
        
        addShadow(.lightGray, opacity: 1.0, radius: 2.0, CGSize(width: 3, height: 3))
        addBorder()
        layer.cornerRadius = 20.0
    }
}


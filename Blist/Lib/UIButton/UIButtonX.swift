
import Foundation
import UIKit

@IBDesignable
class UIButtonX: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 5.0
    @IBInspectable var isRound: Bool = false
    
    var borderColor: UIColor = .clear {
        didSet {
            setupView()
        }
    }
    
    var borderWidth: CGFloat = 0.0 {
        didSet {
            setupView()
        }
    }
    
    override func draw(_ rect: CGRect) {
        setupView()
    }
    
    private func setupView() {
        if isRound {
            cornerRadius = self.frame.width / 2
        }
        layer.cornerRadius = cornerRadius

        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        
        clipsToBounds = true
//        layer.masksToBounds = false
    }
 
}




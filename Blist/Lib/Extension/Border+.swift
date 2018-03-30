
import Foundation
import UIKit

extension UIView {
    
    func addBorder(color: UIColor = .black, width: CGFloat = 0.3) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
}

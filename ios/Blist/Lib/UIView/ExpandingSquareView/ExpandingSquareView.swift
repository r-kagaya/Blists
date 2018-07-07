
import Foundation
import UIKit

protocol ExpandingSquareViewProtocol {
    func animationDidStop()
}

class ExpandingSquareView: UIView, CAAnimationDelegate {
    
    lazy private var circleLayer: CAShapeLayer! = {
        let circleLayer = CAShapeLayer()
        circleLayer.frame = bounds
        circleLayer.fillColor = UIColor.black.withAlphaComponent(0.5).cgColor
        circleLayer.needsDisplayOnBoundsChange = true
        return circleLayer
    }()
    
    var delegate: ExpandingSquareViewProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.addSublayer(circleLayer)
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
    }
    
    func animate() {
        let startPath = UIBezierPath(rect: CGRect(x: frame.width / 2 - 50, y: frame.height, width: 100, height: 100)).cgPath
        circleLayer.path = startPath
        
        let endPath = UIBezierPath(rect: UIScreen.main.bounds).cgPath
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.toValue = endPath
        pathAnimation.duration = 0.2
        pathAnimation.fillMode = kCAFillModeForwards
        pathAnimation.isRemovedOnCompletion = false
        pathAnimation.delegate = self
        
        circleLayer.add(pathAnimation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        delegate?.animationDidStop()
    }
    
}



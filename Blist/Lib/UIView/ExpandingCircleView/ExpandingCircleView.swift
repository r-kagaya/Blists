
import Foundation
import UIKit

protocol ExpandingCircleViewProtocol {
    func animationDidStop()
}

class ExpandingCircleView: UIView, CAAnimationDelegate {
    
    lazy private var circleLayer: CAShapeLayer! = {
        let circleLayer = CAShapeLayer()
        circleLayer.frame = bounds
        circleLayer.fillColor = UIColor.black.withAlphaComponent(0.5).cgColor
        circleLayer.needsDisplayOnBoundsChange = true
        return circleLayer
    }()
    
    var delegate: ExpandingCircleViewProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.addSublayer(circleLayer)
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
    }
    
    func animate() {
        let startSize = CGSize(width: 100, height: 100)
        let inset = (bounds.width / 2) - (startSize.width / 2)
        let startRect = bounds.insetBy(dx: inset,
                                       dy: inset)
        let startPath = UIBezierPath(ovalIn: startRect).cgPath
        circleLayer.path = startPath
        
        let endPath = UIBezierPath(ovalIn: bounds).cgPath
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.toValue = endPath
        pathAnimation.duration = 2
        pathAnimation.fillMode = kCAFillModeForwards
        pathAnimation.isRemovedOnCompletion = false
        
        let fadeOutAnimation = CABasicAnimation(keyPath: "opacity")
        fadeOutAnimation.fromValue = 1
        fadeOutAnimation.toValue   = 0
        fadeOutAnimation.duration  = 1
        fadeOutAnimation.beginTime = 2
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = pathAnimation.duration + fadeOutAnimation.duration
        animationGroup.repeatCount = .infinity
        animationGroup.animations = [pathAnimation, fadeOutAnimation]
        
        circleLayer.add(animationGroup, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        delegate?.animationDidStop()
    }

}


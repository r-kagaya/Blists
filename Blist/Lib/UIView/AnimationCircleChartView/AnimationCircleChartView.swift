
import UIKit


// http://dev.classmethod.jp/smartphone/ios-count-down-view/
// https://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1
class AnimationChartView: UIView {
    
    private let pi = Double.pi
    private let startAngle = CGFloat(3 * Double.pi / 2)
    private let backgroundGraphColor = UIColor(red: 247/255, green: 241/255, blue: 241/255, alpha: 1)
    private let foregroundGraphColor = UIColor.hex(hexStr: "38f9d7", alpha: 1.0)
    private let shapeLayer = CAShapeLayer()
    
    private var totalData: Double = 0.0 {
        didSet {
            layoutSubviews()
        }
    }
    private var completed: Double = 0.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    func setTotal(_ value: Double) {
        self.totalData = value
    }
    
    func setCompleted(_ value: Double) {
        self.completed = value
    }
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius: CGFloat = max(bounds.width, bounds.height) / 2
        let arcWidth: CGFloat = 30
        let startAngle: CGFloat = 0
        let endAngle: CGFloat = 360
        
        let path = UIBezierPath(arcCenter: center,
                                radius: radius - arcWidth / 2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        path.lineWidth = arcWidth
        backgroundGraphColor.setStroke()
        path.stroke()
    }

    override func layoutSubviews() {
        shapeLayer.isHidden = true
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius: CGFloat = max(bounds.width, bounds.height) / 2
        let arcWidth: CGFloat = 30
//        Angleの求め方 -> 直径×円周率×描画したい角度/360度

        let path = UIBezierPath(arcCenter: center,
                                radius: radius - arcWidth / 2,
                                startAngle: startAngle,
                                endAngle: calcCompletedAngle(),
                                clockwise: true)
        
        shapeLayer.frame = bounds
        shapeLayer.lineWidth = arcWidth
        shapeLayer.strokeColor = foregroundGraphColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
        
        drawGraph()
    }
    
    func drawGraph() {
        shapeLayer.isHidden = false
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 1.0
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        shapeLayer.add(animation, forKey: "circleAnim")
    }
    
    private func calcCompletedAngle() -> CGFloat {
        let completePercent = (completed / totalData)
        let endAngle = (360.0 * completePercent) - 90.0
        if endAngle.isNaN {
            return startAngle
        } else if endAngle == 270.0 {
            return CGFloat(Double.pi * 2.0 * 269.9 / 360.0)
        }
        return CGFloat(Double.pi * 2.0 * endAngle / 360.0)
    }
    
}


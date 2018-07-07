

import Foundation
import UIKit

class Gradiate: UIView {
    
    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0

//    let gradientOne = UIColor(red: 135/255, green: 157/255, blue: 212/255, alpha: 1.0).cgColor
//    let gradientTwo  = UIColor(red: 135/255, green: 167/255, blue: 217/255, alpha: 1.0).cgColor
//    let gradientThree = UIColor(red: 222/255, green: 243/255, blue: 248/255, alpha: 1.0).cgColor

    let gradientOne = UIColor(red: 93/255, green: 159/255, blue: 255/255, alpha: 1.0).cgColor
    let gradientTwo  = UIColor(red: 184/255, green: 220/255, blue: 255/255, alpha: 1.0).cgColor
    let gradientThree = UIColor(red: 107/255, green: 187/255, blue: 255/255, alpha: 1.0).cgColor
    
    
    func setUpGradiate() -> CAGradientLayer {
        gradientSet.append([gradientOne, gradientTwo])
//        gradientSet.append([gradientTwo, gradientOne])
        gradientSet.append([gradientTwo, gradientThree])
        gradientSet.append([gradientThree, gradientOne])
        
        gradient.frame = self.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        // 色が切り替わる地点
        //        let locations:[NSNumber] = [
        //            0.100, 0.250, 0.375, 0.500, 0.625, 0.750, 0.900
        //        ]
        //        gradient.locations = locations
        
        gradient.drawsAsynchronously = true
        self.layer.addSublayer(gradient)
        
        return gradient
    }
    
    
    func animateGradient() {
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 4.0
        gradientChangeAnimation.repeatCount = .infinity
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = kCAFillModeForwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradientChangeAnimation.autoreverses = true
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
    }
    
    
}




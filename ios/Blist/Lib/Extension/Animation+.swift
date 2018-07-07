

import Foundation
import UIKit

extension UIView {
    
   /** タップされた時に、小さくする。押されたようなアニメーション
     */
   func touchStartAnimation(){
        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       options: .curveEaseIn,
                       animations: {() -> Void in
                        self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95);
                        self.alpha = 0.9
        }, completion: nil)
    }
    
    /** 元のViewの大きさに戻す */
    func touchEndAnimation(){
        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       options: .curveEaseIn,
                       animations: {() -> Void in
                        self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
                        self.alpha = 1
        }, completion: nil)
    }

    /** 少し縮小した後、拡大して消えるアニメーション */
    func shrinkAndZoom() {
        //少し縮小するアニメーション
        UIView.animate(withDuration: 0.3, delay: 1.0, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { _ in
            //拡大させて、消えるアニメーション
            UIView.animate(withDuration: 0.2, delay: 0.2, options: .curveEaseOut, animations: {
                self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.alpha = 0
            }, completion: { _ in
                self.removeFromSuperview()
            })
        })
    }
  
    func Vibrate() {
        self.layer.removeAllAnimations()
        
        var animation: CABasicAnimation
        animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = 0.1
        animation.repeatCount = .infinity
        animation.fromValue = 2.0 * Float(Double.pi) / 180.0
        animation.toValue = 0 - (animation.fromValue as! Float)
        animation.autoreverses = true
        self.layer.add(animation, forKey: "VibrateAnimationKey")
    }
    
}

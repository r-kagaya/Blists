

import Foundation
import UIKit

protocol DialogProtocol {
    func open()
    func close()
    func add()
    func shake()
    func doStamp()
    func vibrate(amount: Float)
}

extension DialogProtocol where Self: UIView {
    
    /** addSubview
     */
    func add() {
        let app = UIApplication.shared.delegate as! AppDelegate
        self.frame = (app.window?.frame)!
        self.alpha = 0.0
        app.window?.addSubview(self)
    }
    
    func addView() {
        let app = UIApplication.shared.delegate as! AppDelegate
        self.frame = (app.window?.frame)!
//        self.alpha = 0.0
        app.window?.addSubview(self)
    }
    
    
    /** 表示 */
    func open() {
        self.alpha = 0.0
        
        let app = UIApplication.shared.delegate as! AppDelegate
        self.frame = (app.window?.frame)!
        app.window?.addSubview(self)
        
        self.frame.origin.y = UIScreen.main.bounds.height
        
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 1.0
            self.frame.origin.y -= self.frame.height
            
        }, completion: nil)
    }
    
    
    /** FadeIN */
    func fadeIn() {
        self.alpha = 0.0
        
        let app = UIApplication.shared.delegate as! AppDelegate
        self.frame = (app.window?.frame)!
        app.window?.addSubview(self)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
    
    
    
    /** 表示 */
    func bounceOpen(view: UIView) {
        
        view.alpha = 0.0
        fadeIn()
        
        view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
            view.alpha = 1.0
            view.transform = .identity
        })
    }
    
    
    /** クローズ */
    func close() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0
        }, completion: { finished in
            let app = UIApplication.shared.delegate as! AppDelegate
            app.window?.removeFromSuperview()
            app.window?.layer.removeAllAnimations()            
        })
    }
    
    
    /* 揺らし続けるアニメーション */
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
    
    /** スタンプアニメーション */
    func doStamp() {
        self.alpha = 0
        self.isHidden = false
        
        let stampSize = self.frame
        
        UIView.animate(withDuration: 0.05,
                       delay:0.0,
                       usingSpringWithDamping:0.2,
                       initialSpringVelocity:10,
                       options:[],animations:{
                        // サイズを大きくする
                        self.frame = CGRect(x:stampSize.origin.x,
                                            y:stampSize.origin.y,
                                            width:stampSize.size.width + 130,
                                            height:stampSize.size.height + 130)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.05,
                       delay: 0.8,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 90,
                       options: [], animations: {
                        // サイズを元に戻す
                        self.frame = CGRect(x:stampSize.origin.x,
                                            y:stampSize.origin.y,
                                            width:stampSize.size.width,
                                            height:stampSize.size.height)
                        // 透過度を元に戻す
                        self.alpha = 1.0
        },
                       completion:{ finished in
                        // 台紙を揺らす
                        self.vibrate(amount: 3.0)
        })
        
    }
    
    
    /** Viewを揺らすアニメーション
     *  amount = 揺れ幅
     */
    func vibrate(amount: Float) {
        
        if amount > 0 {
            var animation: CABasicAnimation
            animation = CABasicAnimation(keyPath: "transform.rotation")
            animation.duration = 0.1
            animation.fromValue = amount * Float(Double.pi) / 180.0
            animation.toValue = 0 - (animation.fromValue as! Float)
            animation.repeatCount = 1.0
            animation.autoreverses = true
            self.layer.add(animation, forKey: "VibrateAnimationKey")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.close()
            }
            
        } else {
            self.layer.removeAnimation(forKey: "VibrateAnimationKey")
            self.removeFromSuperview()
        }
        
    }
    
    
    
}





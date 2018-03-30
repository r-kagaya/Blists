
import Foundation
import UIKit


class KeyboardUtil {
    
    private var willShowAction: ( () -> Void )?
    private var willHideAction: ( () -> Void )?

    init(willShowAction will: ( () -> Void)? = nil, willHideAction hide: ( () -> Void)? = nil) {
        willShowAction = will
        willHideAction = hide
        
        configureObserver()
    }
    
    // Notificationを設定
    func configureObserver() {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // Notificationを削除
    static func removeObserver() {
        let notification = NotificationCenter.default
        notification.removeObserver(self)
    }
    
    // キーボードが現れた時に、画面全体をずらす。
    @objc func keyboardWillShow(notification: Notification?) {
//        let rect = (notification?.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
//        let duration: TimeInterval? = notification?.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double
        
        if let action = willShowAction {
            action()
        }
    }
    
    // キーボードが消えたときに、画面を戻す
    @objc func keyboardWillHide(notification: Notification?) {
        if let action = willHideAction {
            action()
        }
    }
    
}

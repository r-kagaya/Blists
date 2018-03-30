
import Foundation
import UIKit


extension UIViewController {

    /** 削除ボタン付きのアクションシートを表示
     * @param deleteAction - 削除が選択された時のclosure () -> ()
     */
    func presentDeleteActionSheet(title: String = "削除しますか?",
                                  message: String = "データは残りません",
                                  deleteButtonTitle: String = "削除",
                                  deleteAction: ( () -> Void)? = nil,
                                  cancelButtonTitle: String = "キャンセル",
                                  cancelAction: ( () -> Void)? = nil) {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    
        let destory = UIAlertAction(title: deleteButtonTitle, style: .destructive, handler: { _ in
            if let action = deleteAction {
                action()
            }
        })
        
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
        
        actionSheet.addAction(destory)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }

}


class Alert {

    private var alertController: UIAlertController
    
    required init(title: String, message: String) {
        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    func addAction(title: String, style: UIAlertActionStyle, handler: ( (UIAlertAction) -> Void)? = nil) -> Alert {
        alertController.addAction(UIAlertAction(title: title, style: style, handler: handler))
        return self
    }
    
    func open(handler: ( () -> Void)? = nil) {
        ControllerUtil.getTopMostViewController().present(alertController, animated: true, completion: handler)
    }
    
    
    
}








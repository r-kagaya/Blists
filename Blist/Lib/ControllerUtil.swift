

import Foundation
import UIKit

struct ControllerUtil {
    
    /** 前面にあるUIViewControllerを取得
     * @return
     */
    static func getTopMostViewController() -> UIViewController {
        var controller = UIApplication.shared.keyWindow?.rootViewController
        while ((controller!.presentedViewController) != nil) {
            controller = controller!.presentedViewController
        }
        
        return controller!
    }

}
